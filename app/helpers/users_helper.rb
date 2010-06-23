module UsersHelper
  
  def styles
    styles = options_for_select([["General", "nil"], ["Endnote", "endnote"],
  	            ["Bibitem", "bibitem"], ["Bibtex", "bibtex"], ["Rd", "rd"],
  	            ["Nature", "nature"], ["Science", "science"],
  	            ["Genome Biology", "genome_biol"], ["Genome Research", "genome_res"],
  	            ["Nucleic Acids Research", "nar"], ["Current Biology", "current"],
  	            ["Trends in *", "trends"], ["Cell Press", "cell"]])
  end
  
end