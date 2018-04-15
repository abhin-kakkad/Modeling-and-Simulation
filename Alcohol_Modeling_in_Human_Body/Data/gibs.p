 set   autoscale                        
      set title "Drug Dispersion in GI-Tract and Blood Stream for Regular Dosage"
      set xlabel "Time (hours)"
      set ylabel "Amount of Drug"
      plot "ConstantDosageGI.dat", "ConstantDosageBS.dat"
