library(madshapR)
library(tidyverse)
library(fs)

dataset <- 
  DEMO_files$dataset_TOKYO %>% as_dataset(col_id = 'part_id') %>%
  data_dict_apply(DEMO_files$dd_TOKYO_format_maelstrom_tagged) 

fs::dir_delete('tmp')
dataset %>% 
  dataset_visualize(group_by = gndr,.dataset_name = 'TOKYO',to = 'tmp')
fs::dir_delete('docs')
fs::dir_copy(path = 'tmp/docs',new_path = 'docs')
fs::dir_delete('tmp')
