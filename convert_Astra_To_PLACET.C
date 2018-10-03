//void convert_RFTrack_To_PLACET(TString &infileName, TString &outfileName){
void convert_Astra_To_PLACET(){
 
  Double_t px,py,pz,p,x,y,z,charge;
  Double_t ref_pz;
  Double_t xp,yp,energy;
  Double_t time;
  Int_t part_index,flag;


  //std::ifstream ifile(infileName,ios_base::in);
  //std::ofstream ofile(outfileName,ios_base::out);

  std::string line;

  Double_t m_e = 0.511e-3; // GeV


  std::ifstream ifile("rfgun_FD_2.0600.001",ios_base::in);
  std::ofstream ofile("output_Astra_linac_placet.dat",ios_base::out);
  while(getline(ifile,line)){

    if (!line.length() || line[0] == '#')
      continue;
    std::istringstream iss(line);

    iss>>x>>y>>z>>px>>py>>pz>>time>>charge>>part_index>>flag;

    if ( flag == -99 ){
      ref_pz = pz;
      continue;
    }

    if ( flag == 5 ){
      x *= 1.0e6;   // meter to micron meter
      y *= 1.0e6;   // meter to micron meter
      z *= 1.0e6;   //  meter to micron meter
      pz += ref_pz;
      p = sqrt(px*px+py*py+pz*pz); 

      //energy = hypot(p,m_e);  // GeV
      energy = sqrt(p*p + m_e*m_e);  // GeV

      xp = px/pz*1e6;  // radian to micron radian
      yp = py/pz*1e6;  // radian to micron radian

      if(TMath::IsNaN(xp) || TMath::IsNaN(yp))
        continue;

      ofile<< energy << "\t" << x<<"\t"<<y<<"\t"<<z<<"\t"<<xp<<"\t"<<yp<<"\t"<<std::endl;
    }

  }
  
  ifile.close();
  ofile.close();

}
