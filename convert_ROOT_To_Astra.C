void convert_ROOT_To_Astra(const char *fileName){

  TFil * fileROOT  = new TFile(TString(fileName) + ".root", "READ");
  TTree *tree = (TTree*)fileROOT->Get("tree");

  Double_t x,y,z,px,py,pz,p,energy;
  Int_t type;
  Double_t time;

  tree->SetBranchAddress("x",&x);
  tree->SetBranchAddress("y",&y);
  tree->SetBranchAddress("px",&px);
  tree->SetBranchAddress("py",&py);
  tree->SetBranchAddress("pz",&pz);
  tree->SetBranchAddress("e",&energy);
  tree->SetBranchAddress("type",&type);
  tree->SetBranchAddress("t",&time);


  std::ofstream ofile("target_" + TString(fileName) + ".dat"); 
  ofile<<"# x(m) y(m) z(m) px(eV) py(eV) pz(eV) time(ns)  charge(nC) index status"<<std::endl;
  
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

  Double_t charge = 6.7 / 1e4;  // 6.7 nc
  Int_t particle_index = 0;
  Int_t status_flag=5;  // standard particle

  // Long64_t nentries = tree->GetEntries();
  for(Long64_t i = 0; i<nentries; i++) {
    tree->GetEntry(i);
    if(type == 3){
      x *= 1.0e-3;  // mm to  m
      y *= 1.0e-3;
      z =0;
      px *= 1.0e9;  // GeV to eV
      py *= 1.0e9;
      pz *= 1.0e9;
      
      time -= mean_t;  // Remove the 2 meter drift time
      time *= 3.3356e-3;  // mm/c to ns

      ofile<< x<<"\t"<<y<<"\t"<<z<<"\t"<<px<<"\t"<<py<<"\t"<<pz<<"\t"<<time<<"\t"<<charge<<"\t"<<++particle_index<<"\t"<<status_flag<<std::endl;
    }
  }

  ofile.close();

  fileROOT->Close();
  delete fileROOT;
}
