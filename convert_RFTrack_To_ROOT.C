void convert_RFTrack_To_ROOT(TString infileName){

  std::ifstream ifile(infileName,ios_base::in);
  std::string line;

  TString outfileName(infileName);
  outfileName.ReplaceAll(".dat",".root");

  double e,x,y,z,xp,yp;
  double t,pc,px,py,pz;

  TFile * fileROOT  = new TFile(outfileName, "RECREATE");
  TTree tree("tree","A tree with particle information");

  tree.Branch("x",&x,"x/D");
  tree.Branch("y",&y,"y/D");
  tree.Branch("px",&px,"px/D");
  tree.Branch("py",&py,"py/D");
  tree.Branch("pz",&pz,"pz/D");
  tree.Branch("t",&t,"t/D");
  tree.Branch("e",&e,"e/D");

  while(getline(ifile,line)){
    if (!line.length() || line[0] == '#')
      continue;
    std::istringstream iss(line);
    iss>>x>>xp>>y>>yp>>t>>pc;

    xp *= 1e-3;
    yp *= 1e-3;
    pc *= 1e-3;

    pz = abs(pc/sqrt((1 + xp*xp + yp*yp)));
    std::cout<<"pz is"<<pz<<std::endl;
    px = xp*pz;
    py = xp*pz;

    e = sqrt(pc*pc+0.511*0.511*1e-6);  // GeV

    tree.Fill();
  }

  ifile.close();

  tree.Write();

  fileROOT->Close();
  delete fileROOT;

}
