// $Id$

/*
 Copyright (c) 2007-2015, Trustees of The Leland Stanford Junior University
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:

 Redistributions of source code must retain the above copyright notice, this 
 list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this
 list of conditions and the following disclaimer in the documentation and/or
 other materials provided with the distribution.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/*hexmesh.cpp
 *
 * 6 Neighbour Max Hexagonal Mesh using Row Offsets to stay in Cartesian coordinates
 *
 */

#include "booksim.hpp"
#include <vector>
#include <sstream>
#include <ctime>
#include <cassert>
#include "hexmesh.hpp"
#include "random_utils.hpp"
#include "misc_utils.hpp"

HexMesh::HexMesh(const Configuration &config, const string &name):
Network( config, name )
{
  _ComputeSize( config );
  _Alloc( );
  _BuildNet( config );
}

void HexMesh::_ComputeSize(const Configuration &config)
{
  _x = config.GetInt( "x" );
  _y = config.GetInt( "y" );

  // Size = row*columns of nodes
  _size = _x*_y;
  _nodes = _size;

  // For Channels, each node can have up to 6 channels.
  // Safe thing to do is just take Nodes*6 for inter-router
  _channels = 6*_nodes;

  // Allocate Global Variables for use later
  gX = _x;
  gY = _y;
}

void HexMesh::RegisterRoutingFunctions() {
  // We need to create custom routing functions for Hex Mesh to work. For Now ignore, as we focus on creating the topology.

}
void HexMesh::_BuildNet(const Configuration &config)
{
  int neighbourNode;
  int neighbourDir;
  int inputChannel;
  int outputChannel;
  
  ostringstream router_name;
      
  // Temporary Default to latency 1
  int latency = 1;

  //latency type, noc or conventional network
  bool use_noc_latency;
  use_noc_latency = (config.GetInt("use_noc_latency")==1);
  
  for ( int node = 0; node < _size; ++node ) {

    router_name << "router_"<< _getNodeX(node) << "_" << _getNodeY(node);

    // Each router can have up to 7 Input/Output Channels. 6 Neighbours + Inject/eject
    _routers[node] = Router::NewRouter( config, this, router_name.str( ), 
					node, 7, 7);
    _timed_modules.push_back(_routers[node]);

    router_name.str("");
    router_name.clear();

    // Setup channel connections to/from neighbours 
    for (int dir = 0; dir < 6; ++dir ) {

      // Find the neighbor 
      neighbourNode  = _DirNode(node, dir);

      // If the neighbour doesn't exist, just continue to next loop
      if (neighbourNode == -1) continue;

      // Get the input channel number
      // For Input Channels, invert the direction. I.E for the Node to the East, the input channel is that node's West Channel

      // O = East. 3 = West
      // 1 = NorthEast. 4 = SoutWest
      // 2 = NorthWest. 5 = SouthEast
      neighbourDir = (dir+3)%6;
      inputChannel = _DirChannel(neighbourNode, neighbourDir);

      //add the input channel
      _routers[node]->AddInputChannel( _chan[inputChannel], _chan_cred[inputChannel] );

      //set input channel latency
      if(use_noc_latency){
	_chan[inputChannel]->SetLatency(latency);
	_chan_cred[inputChannel]->SetLatency(latency);
      } else {
	_chan[inputChannel]->SetLatency(1);
	_chan_cred[inputChannel]->SetLatency(1);
      }
      //get the output channel number
      outputChannel = _DirChannel( node, dir );
      
      //add the output channel
      _routers[node]->AddOutputChannel( _chan[outputChannel], _chan_cred[outputChannel] );

      //set output channel latency
      if(use_noc_latency){
	_chan[outputChannel]->SetLatency( latency );
	_chan_cred[outputChannel]->SetLatency( latency );
      } else {
	_chan[outputChannel]->SetLatency( 1 );
	_chan_cred[outputChannel]->SetLatency( 1 );

      }
    }
    //injection and ejection channel, always 1 latency
    _routers[node]->AddInputChannel( _inject[node], _inject_cred[node] );
    _routers[node]->AddOutputChannel( _eject[node], _eject_cred[node] );
    _inject[node]->SetLatency( 1 );
    _eject[node]->SetLatency( 1 );
  }
}

int HexMesh::_DirChannel(int node, int dir)
{
  // The base channel for a node is 6*node
  int base = 6*node;
  // The offset for a channel depends on the direction
  // 0 - East, 1 - NorthEast, 2 - NorthWest,
  // 3 - West, 4 - SouthWest, 5 - SouthEast
  return ( base + dir );
}

int HexMesh::_DirNode(int node, int dir)
{
  // Get Current XY Equivalent of Node
  int xcoord = _getNodeX(node); // Current row position
  int ycoord = _getNodeY(node); // Current column position
  int difx;
  int dify;

  // Depending on Direction, dx and dy are different.
  // 0 - East, 1 - NorthEast, 2 - NorthWest,
  // 3 - West, 4 - SouthWest, 5 - SouthEast

  // Row Parity Affects Diagonal dX/dY
  int rowParity = ycoord%2;
  switch (dir)
  {
    case 0:
      difx = 1;
      dify = 0;
      break;
    case 1:
      difx = (rowParity==0) ? 0 : 1;
      dify = 1;
      break;
    case 2:
      difx = (rowParity==0) ? -1 : 0;
      dify = 1;
      break;
    case 3:
      difx = -1;
      dify = 0;
      break;
    case 4:
      difx = (rowParity==0) ? -1 : 0;
      dify = -1;
      break;
    case 5:
      difx = (rowParity==0) ? 0 : 1;
      dify = -1;
      break;
    default:
      cout << "Error: Unsupported Direction: " << dir << endl;
      exit (-1);
  }

  // Calculate new node coords based on direction.
  int targX = xcoord+difx;
  int targY = ycoord+dify;

  // If the bounds are exceeded, return -1 to indicate no node exists there
  if (targY < 0 || targY >= _y) return -1;
  if (targX < 0 || targX >= _x) return -1;

  // Calculate the node number based on the new target coordinates
  int targetNode = _getNodeFromXY(targX, targY);
  return targetNode;
}

int HexMesh::_getNodeX (int node)
{
  return node%_x;
}

int HexMesh::_getNodeY (int node)
{
  return node/_x; 
}

int HexMesh::_getNodeFromXY (int x, int y)
{
  return (y*_x) + x;
}

int HexMesh::GetX( ) const
{
  return _x;
}

int HexMesh::GetY( ) const
{
  return _y;
}

double HexMesh::Capacity( ) const
{
  return 1.0;
}
