//void convert_Astra_To_RFTrack(TString &infileName, TString &outfileName){
void convert_Astra_To_RFTrack(){

  std::ifstream ifile("initial_cathode_FD_2.ini",ios_base::in);
  std::ofstream ofile("cathode_Bunch6dT.dat",ios_base::out);

  std::string line;

  Double_t px,py,pz,x,y,z,time,charge;
  Int_t index,flag;

  Double_t xp,yp,pc;

  charge = 6.7/1.07e5;  /// nC
  index = 2;   /// positron
  flag = 5; // standard particles

  while(getline(ifile,line)){
    if (!line.length() || line[0] == '#')
      continue;
    std::istringstream iss(line);
    iss>>x>>xp>>y>>yp>>time>>pc>>std::endl;

    xp *= 1e-3;
    yp *= 1e-3;

    pz = abs(pc/sqrt((1 + xp*xp + yp*yp)));  //MeV
    px = xp*pz;
    py = yp*pz;

    
    x *= 1e-3; // meter <- millimeter
    y *= 1e-3; // meter <- millimeter
    z *= 0; // meter <- millimeter
    px *= 1e6; // eV <- MeV
    py *= 1e6; // eV <- MeV
    pz *= 1e6; // eV <- MeV
    time /= 3e2;  //ns <- mm/c

    // For Bunch6D
    //xp = px/pz*1e3; // milliradian
    //yp = py/pz*1e3; // milliradian
    //pc = sqrt(px*px+py*py+pz*pz);  //MeV
    //pc = 10 * 1e-6;  //eV to  MeV
    ofile<<x<<y<<z<<px<<py<<pz<<time<<charge<<index<<flag;
  }
  ofile.close();
  ifile.close();
}
