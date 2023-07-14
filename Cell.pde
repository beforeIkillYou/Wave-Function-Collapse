
class Cell{
  int x,y;
  boolean collapsed;
  ArrayList<Tile> possible=new ArrayList<Tile>();
  Tile finalTile;
  
  Cell(int x_,int y_,ArrayList<Tile> possible_){
    x=x_;
    y=y_;
    possible=possible_;
    collapsed=false;
  }
  
  void display(){
     if(collapsed){
      image(finalTile.img,x*rows,y*cols,rows,cols);
     }
  }
  
  boolean isPossible(Cell c, Tile t){//checks if the tile is present in possible
    for(Tile tile : c.possible){
      if(tile.isSame(t))  return true;
    }
    return false;
  }
  
   //randomly decides the final tile and follows the core algo
  void finalise(){
    collapsed=true;
    int randChoice=(int)random(possible.size());
    finalTile=possible.get(randChoice);
    
    
    //for up-cell
    if(y>0){
      ArrayList<Tile> newPossible=new ArrayList<Tile>();
      for(Tile t : tiles){
        if(t.edges[2]==finalTile.edges[0]  &&  isPossible(grid[x][y-1],t)){
          newPossible.add(t);
        }
      }
      grid[x][y-1].possible=newPossible;
    }
    
    //for down cell
    if(y<dim-1){
      ArrayList<Tile> newPossible=new ArrayList<Tile>();
      for(Tile t : tiles){
        if(t.edges[0]==finalTile.edges[2]  &&  isPossible(grid[x][y+1],t)){
          newPossible.add(t);
        }
      }
      grid[x][y+1].possible=newPossible;
    }
    
    //for left
    if(x>0){
      ArrayList<Tile> newPossible=new ArrayList<Tile>();
      for(Tile t : tiles){
        if(t.edges[1]==finalTile.edges[3]  &&  isPossible(grid[x-1][y],t)){
          newPossible.add(t);
        }
      }
      grid[x-1][y].possible=newPossible;
    }
    
    //for right
    if(x<dim-1){
      ArrayList<Tile> newPossible=new ArrayList<Tile>();
      for(Tile t : tiles){
        if(t.edges[3]==finalTile.edges[1]  &&  isPossible(grid[x+1][y],t)){
          newPossible.add(t);
        }
      }
      grid[x+1][y].possible=newPossible;
    }
  }
  
}
