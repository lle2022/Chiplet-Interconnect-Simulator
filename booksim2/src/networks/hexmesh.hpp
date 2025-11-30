#ifndef _HEXMESH_HPP_
#define _HEXMESH_HPP_

#include "network.hpp"
#include "routefunc.hpp"

class HexMesh : public Network {
  int _x;
  int _y;

  void _ComputeSize (const Configuration &config);
  void _BuildNet (const Configuration &config );

  int _DirChannel (int node, int dir);

  int _getNodeX (int node);
  int _getNodeY (int node);
  int _getNodeFromXY(int x, int y);

public:
  HexMesh(const Configuration &config, const string &name);
  static void RegisterRoutingFunctions();

  int GetX( ) const;
  int GetY( ) const;
  static int DirNode(int node, int dir, int x, int y); 
  static int HexDistance(int x1, int y1, int x2, int y2);

  double Capacity( ) const;
};

// Routing Functions
void dor_hexmesh( const Router *r, const Flit *f, int in_channel,
		    OutputSet *outputs, bool inject );

void dor_adaptive_hexmesh( const Router *r, const Flit *f, int in_channel,
		    OutputSet *outputs, bool inject );
#endif
