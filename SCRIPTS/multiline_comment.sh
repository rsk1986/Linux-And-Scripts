#!/bin/bash

if false
then

        This
                is
                        multiline-comment

fi


: '
        this
                is
                        as-well
'

<<COMMENT1
        this
                is
                        too...
COMMENT1


ls -l $HOME | wc -l
