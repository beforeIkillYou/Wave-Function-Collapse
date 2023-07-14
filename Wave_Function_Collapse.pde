//Wave function collapse

//Date:: 14july,2023
//author:: gagan mishra
//code:: implements basic wfc...the tiles can be changed but the basic algo remains same

final int dim=50;
int rows,cols;
ArrayList<Tile> tiles=new ArrayList<Tile>();
Cell grid[][];

void setup(){
  size(750,750);
  background(0);
  loadTiles();
  
  rows=width/dim;
  cols=height/dim;
  
  grid=new Cell[dim][dim];
  for(int i=0;i<dim;i++){
    for(int j=0;j<dim;j++){
      grid[i][j]=new Cell(i,j,tiles);
      
      //drawing intial grid
      stroke(255);
      strokeWeight(dim*0.005);
      noFill();
      rect(i*rows,j*cols,rows,cols);
    }
  }
}


void draw(){
  //frameRate(1);
  cellWithMinEntropy();
  
  //display each cell
  for(int i=0;i<dim;i++){
    for(int j=0;j<dim;j++){
      grid[i][j].display();
      //print(grid[j][i].possible.size()+" "); //printing entropy for debugging
    }//println();
  }//println("___________________");
  
  upgradeEntropy();
  
  if(allcollapsed()){
    print("Completed\n");
    noLoop();
  }
}


//finds and returns the cell on the grid  with  min entropy
void cellWithMinEntropy(){
  boolean allsame=true;
  int r=0,c=0;
  //assign to first non colapsed cell
  outer: for(int i=0;i<dim;i++){
    for(int j=0;j<dim;j++){
      if(grid[i][j].collapsed==false){
        r=i;
        c=j;
        break outer;
      }
    }
  }
  int minLen=grid[r][c].possible.size();
  
  for(int i=0;i<dim;i++){
    for(int j=0;j<dim;j++){
      
        if(grid[i][j].possible.size() < minLen  &&  grid[i][j].possible.size()>0 && !grid[i][j].collapsed){ //the minimum non zero entropy
          allsame=false;
          r=i;
          c=j;
          minLen=grid[i][j].possible.size(); 
        }
        
        if(grid[i][j].possible.size() > minLen)  allsame=false;
    }
  }
  
  int randr=(int)random(dim),randc=(int)random(dim);//random choice if all same
  if(allsame && grid[randr][randc].collapsed==false)   grid[randr][randc].finalise(); //if all entropy is same then return a random cell
  else if(grid[r][c].collapsed==false)         grid[r][c].finalise();//finalise follows the core algo
}

boolean allcollapsed(){
  for(int i=0;i<dim;i++){
    for(int j=0;j<dim;j++){
      if(grid[i][j].collapsed==false)  return false;
    }
  }
  return true;
}


//CORE LOGIC
void upgradeEntropy(){} //transefeered the logic to finalising the cell



//hardcoded loading of all tiles
void loadTiles(){
  tiles.add(new Tile(loadImage("imgs/0.png"),"0000"));
  
  tiles.add(new Tile(loadImage("imgs/1.png"),"1010"));
  
  tiles.add(new Tile(loadImage("imgs/2.jpg"),"0101"));
  
  tiles.add(new Tile(loadImage("imgs/3.png"),"0110"));
  
  tiles.add(new Tile(loadImage("imgs/4.jpg"),"0011"));
  
  tiles.add(new Tile(loadImage("imgs/5.jpg"),"1100"));
  
  tiles.add(new Tile(loadImage("imgs/6.jpg"),"1001"));

  tiles.add(new Tile(loadImage("imgs/7.jpg"),"0111"));
  
  tiles.add(new Tile(loadImage("imgs/8.jpg"),"1011"));
  
  tiles.add(new Tile(loadImage("imgs/9.jpg"),"1101"));
  
  tiles.add(new Tile(loadImage("imgs/10.jpg"),"1110"));
  
  tiles.add(new Tile(loadImage("imgs/11.png"),"1111"));
}
