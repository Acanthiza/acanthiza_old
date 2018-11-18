

  datForBox <- dat %>%
    dplyr::mutate(lab = paste0(Frame,"_",Year)) %>%
    dplyr::select(Man
                  , Frame
                  , Year
                  , Use
                  , lab
                  , SeatAngle
                  ,HeadAngle
                  ,BBDrop
                  ,ChainStay
                  ,ForkRake
                  ,Stack
                  ,Reach
                  ,HeadTube
                  ,Trail
                  ) %>%
    tidyr::gather(attribute,value,6:ncol(.)) %>%
    dplyr::group_by(attribute) %>%
    dplyr::arrange(value) %>%
    dplyr::mutate(x = seq(-1,1,length.out=length(unique(.$lab)))) %>%
    dplyr::ungroup()
    
  
    ggplot(datForBox) +
      geom_boxplot(aes(y=value)) +
      geom_text(aes(label = lab, x=x,y=value,colour=Use),size=2) +
      facet_wrap(~attribute, scales = "free") +
      coord_flip()
  