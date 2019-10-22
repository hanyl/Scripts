void convert_ROOT_To_RFTrack(const char *fileName){

  TFile * fileROOT  = new TFile(TString(fileName) + ".root", "READ");
  TTree *tree = (TTree*)fileROOT->Get("tree");

  Double_t x,y,z,px,py,pz,p,energy;
  Int_t type;
  //Double_t time;
  Double_t time;
  Double_t bunch_length = 500e-6;  // meter


  tree->SetBranchAddress("x",&x);
  tree->SetBranchAddress("y",&y);
  tree->SetBranchAddress("px",&px);
  tree->SetBranchAddress("py",&py);
  tree->SetBranchAddress("pz",&pz);
  tree->SetBranchAddress("e",&energy);
  tree->SetBranchAddress("type",&type);
  tree->SetBranchAddress("t",&time);

  std::ofstream ofile("target_" + TString(fileName) + ".dat"); 
  ofile<<"# x(mm)   xp(mrad)   y(mm)   yp(mrad)  time(mm/c)  Pc(MeV)"<<std::endl;
  
  Double_t mean_t = 0;
  Int_t N_positron = 0;
  Long64_t nentries = tree->GetEntries();
  for(Long64_t i = 0; i<nentries; i++) {
    tree->GetEntry(i);
    if(type == 3){
      mean_t += time;
      N_positron++;
    }
  }
  mean_t /= N_positron;

  // Long64_t nentries = tree->GetEntries();
  for(Long64_t i = 0; i<nentries; i++) {
    tree->GetEntry(i);
    if(type == 3){
      p = sqrt(px*px+py*py+pz*pz) * 1e3;  // MeV
      Double_t xp = px/pz * 1e3;
      Double_t yp = py/pz * 1e3;

      if(TMath::IsNaN(xp) || TMath::IsNaN(yp))
        continue;

      time -= mean_t;  // Remove the 2 meter drift time

      //time = gRandom->Gaus(0,bunch_length) * 1.0e3;
      //cout<<"time is "<<time<<endl;
      ofile<< x<<"\t"<<xp<<"\t"<<y<<"\t"<<yp<<"\t"<<time<<"\t"<<p<<std::endl;
    }
  }

  ofile.close();

  fileROOT->Close();
  delete fileROOT;
}
