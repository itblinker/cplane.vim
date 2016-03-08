"{{{ source guard
let [s:plugin, s:enter] = maktaba#plugin#Enter(expand('<sfile>:p'))
if !s:enter
    finish
endif
"}}}
let g:cplane_component_database =  [ {'name': 'rrom', 'sct_top_dir': 'RROM', 'sct_script': 'sct_rrom.sh'},
                                   \ {'name': 'uec',  'sct_top_dir': 'UEC',  'sct_script': 'sct_uec.sh'},
                                   \ {'name': 'enbc', 'sct_top_dir': 'ENBC', 'sct_script': 'sct_enbc.sh'},
                                   \ {'name': 'cellc','sct_top_dir': 'CELLC','sct_script': 'sct_cellc.sh'},
                                   \ {'name': 'tupc', 'sct_top_dir': 'TUPC', 'sct_script': 'sct_tupc.sh'},
                                   \ {'name': 'mcec', 'sct_top_dir': 'MCEC', 'sct_script': 'sct_mcec.sh'}
                                   \ ]


