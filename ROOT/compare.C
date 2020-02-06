#include "TApplication.h"
#include "TEntryList.h"
#include "TEventList.h"
#include "TTree.h"
#include "TChain.h"
#include "TRandom.h"
#include "TH1F.h"
#include "TCut.h"
#include "TFile.h"
#include "TSystem.h"

TChain *chain1;
TChain *chain2;

void file(){
  chain1 = new TChain("tree");
  chain2 = new TChain("tree");

  chain1->Add("output_geant4_4.46GeV_12mm_0.5mm.root");
  chain2->Add("output_beam_AMD.root");
}

void x(){
  file();
  TPostScript ps("x.eps",113);
  TH1F *histo1 = new TH1F("histo1",";x (mm);Entries/1mm",50,-25,25);
  TH1F *histo2 = new TH1F("histo2",";x (mm);Entries/1mm",50,-25,25);
  chain1->Draw("x >> histo1","type==3");
  chain2->Draw("x >> histo2");
  solid_comp(histo1,histo2,"After Target","After AMD");
  histo1->Draw("same");
  histo1->GetXaxis()->CenterTitle();
  histo1->GetYaxis()->CenterTitle();
  ps.Close();


}

void energy(){
  file();
  TPostScript ps("e.eps",113);
  TH1F *histo1 = new TH1F("histo1",";Energy (MeV);Entries/2MeV",50,0,100);
  TH1F *histo2 = new TH1F("histo2",";Energy (MeV);Entries/2MeV",50,0,100);
  chain1->Draw("e*1000 >> histo1","type==3");
  chain2->Draw("e*1000 >> histo2");
  solid_comp(histo1,histo2,"After Target","After AMD");
  histo1->Draw("same");
  histo1->GetXaxis()->CenterTitle();
  histo1->GetYaxis()->CenterTitle();
  ps.Close();
}


void div_energy(){
  file();
  TPostScript ps("e.eps",113);
  TH1F *histo1 = new TH1F("histo1",";Energy (MeV);Entries/2MeV",50,0,100);
  TH1F *histo2 = new TH1F("histo2",";Energy (MeV);Entries/2MeV",50,0,100);
  chain1->Draw("e*1000 >> histo1","type==3");
  chain2->Draw("e*1000 >> histo2");
  histo2->Divide(histo1);
  histo2->Draw();
  histo2->GetYaxis()->SetTitle("Suvived After AMD");
  histo2->GetXaxis()->CenterTitle();
  histo2->GetYaxis()->CenterTitle();
  ps.Close();
}

void px_e(){
  file();
  TPostScript ps("px_e.eps",113);
  TH1F *histo1 = new TH1F("histo1",";x' (mrad);Entries/40mrad",50,-1000,1000);
  TH1F *histo2 = new TH1F("histo2",";x' (mrad);Entries/40mrad",50,-1000,1000);
  chain1->Draw("px/e*1000 >> histo1","type==3");
  chain2->Draw("px/e*1000 >> histo2");
  solid_comp(histo1,histo2,"After Target","After AMD");
  histo1->GetXaxis()->CenterTitle();
  histo1->GetYaxis()->CenterTitle();
  ps.Close();             
} 
