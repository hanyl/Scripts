void calculateE(){

  TString infileName("output_beam_TW.root");

  std::ifstream ifile(infileName,ios_base::in);
  std::string line;

  double e,t,Ef;

  TFile * fileROOT  = new TFile(infileName, "UPDATE");
  TTree *tree = (TTree*)fileROOT->Get("tree");

  TBranch *br = tree->Branch("Ef",&Ef,"e/D");
  tree->SetBranchAddress("t",&t);
  tree->SetBranchAddress("e",&e);

  double t_max = 10819;
  double t_start = t_max - 25;
  double t_end = t_max + 25;

  TH1F *h1 = new TH1F("h1","histo t",100,t_start,t_end);

  tree->Draw("t>>h1","t>10500","colz");
  double t0 = h1->GetBinCenter(h1->GetMaximumBin());

  TString ss = "abs(t-" + to_string(t0) + ")<<7.82/2 && e>0.1";

  TH1F *h2 = new TH1F("h2","histo E",100,0.1,0.3);
  tree->Draw("e>>h2",ss);
  double mean_E = h2->GetMean();

  double omega = 2 * 3.1415926 * 2.856e9;

  Long64_t nentries = tree->GetEntries();
  for (Long64_t i=0;i<nentries;i++) {
          tree->GetEntry(i);
          Ef = e + (1.54-mean_E)*cos(omega*(t-t0)/1e3/299792458);
          br->Fill();
  }

  delete h1;

  tree->Write();
  delete fileROOT;


}

