//void drawPhaseSpace(const char *fileName){
void drawPhaseSpace(){
  TString fileName("output_beam_TW_11");
  TFile * fileROOT  = new TFile(TString(fileName) + ".root", "READ");
  TTree *tree = (TTree*)fileROOT->Get("tree");
  
  TH2F *h2d1 = new TH2F("h2d1",";x (mm) ;x' (mrad)",100,-20,20,100,-500,500);
  TPostScript ps2d1("scatter_amd_xxp.eps",113);
  tree->Draw("px/e*1000:x>>h2d1");
  h2d1->GetXaxis()->CenterTitle();
  h2d1->GetYaxis()->CenterTitle();
  h2d1->Draw("colZ");
  gStyle->SetStatX(0.9);
  gStyle->SetStatY(0.9);

  ps2d1.Close();

  //TCut cut = "t > 18750 & t < 18900";

}

