void convert_To_Parmela(){
  TString fileName("new_initial");

  TFile * fileROOT  = new TFile(fileName + ".root", "READ");
  TTree *tree = (TTree*)fileROOT->Get("tree");

  Double_t x,y,z,px,py,pz,energy;
  Double_t phi;
  Double_t xp,yp;
  Int_t type;
  Double_t time;
  Double_t bunch_length = 500e-6;  // meter


  tree->SetBranchAddress("x",&x);
  tree->SetBranchAddress("y",&y);
  tree->SetBranchAddress("px",&px);
  tree->SetBranchAddress("py",&py);
  tree->SetBranchAddress("pz",&pz);
  tree->SetBranchAddress("e",&energy);
  tree->SetBranchAddress("phi",&phi);

  std::ofstream ofile(fileName + "_parmela.txt"); 

  Long64_t nentries = tree->GetEntries();
  for(Long64_t i = 0; i<nentries; i++) {
    tree->GetEntry(i);
    //if(type == 3){
      Double_t p = sqrt(px*px+py*py+pz*pz);
      x /= 10;
      y /= 10;
      xp = px/p;
      yp = py/p;
      energy = energy * 1e3 - 56.0;
      //ofile<< x<<"\t"<<xp<<"\t"<<y<<"\t"<<yp<<"\t"<<phi<<"\t"<<energy<<"\r\n"<<std::endl;
      ofile<< x<<"\t\t"<<xp<<"\t\t"<<y<<"\t\t"<<yp<<"\t\t"<<phi<<"\t\t"<<energy<<"\r\n";
    //}
  }

  ofile.close();

  fileROOT->Close();
  delete fileROOT;
}
