//void convert_Astra_To_RFTrack(TString &infileName, TString &outfileName){
void convert_Astra_To_RFTrack(){

  std::ifstream ifile("initial_cathode_FD_2.ini",ios_base::in);
  std::ofstream ofile("cathode_Bunch6dT.dat",ios_base::out);

  std::string line;

  Double_t px,py,pz,x,y,z,time,charge;
  Int_t index,flag;

  Double_t xp,yp,pc;

  while(getline(ifile,line)){
    if (!line.length() || line[0] == '#')
      continue;
    std::istringstream iss(line);
    iss>>x>>y>>z>>px>>py>>pz>>time>>charge>>index>>flag;
    
    x *= 1e3; // meter to millimeter
    y *= 1e3; // meter to millimeter
    z *= 1e3; // meter to millimeter
    px *= 1e-6; // eV to MeV
    py *= 1e-6; // eV to MeV
    pz *= 1e-6; // eV to MeV
    time *= 3e2;  //ns to mm/c

    // For Bunch6D
    //xp = px/pz*1e3; // milliradian
    //yp = py/pz*1e3; // milliradian
    //pc = sqrt(px*px+py*py+pz*pz);  //MeV
    //pc = 10 * 1e-6;  //eV to  MeV
    //ofile<< x<<"\t"<<xp<<"\t"<<y<<"\t"<<yp<<"\t"<<time<<"\t"<<pc<<std::endl;

    // For Bunch6dT
    Double_t mass = 0.511; // MeV
    Int_t N = 6.25e9/1e4;
    Int_t Q =-1;
    ofile<< x<<"\t"<<px<<"\t"<<y<<"\t"<<py<<"\t"<<z<<"\t"<<pz<<"\t"<<mass<<"\t"<<Q<<"\t"<<N<<"\t"<<time<<std::endl;
  }
  ofile.close();
  ifile.close();
}
