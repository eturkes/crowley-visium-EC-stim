#!/bin/sh

#    This file is part of crowley-visium-EC-stim.
#    Copyright (C) 2022  Emir Turkes, Gerard Crowley, UK DRI at UCL
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#    Emir Turkes can be contacted at emir.turkes@eturkes.com

# Shell script for building a Singularity image from Docker Hub and running it.

singularity pull crowley-visium-ec-stim.simg docker://eturkes/crowley-visium-ec-stim:R4.2.1v1

if [ "$1" = "all" ]; then
    singularity exec \
        -B .:/home/rstudio/crowley-visium-EC-stim \
        crowley-visium-ec-stim.simg \
    Rscript -e "source('/home/rstudio/crowley-visium-EC-stim/R/run_all.R')"
elif [ "$1" = "rstudio" ]; then
    # TODO: Point bind point to user's home
    DISABLE_AUTH=true RSTUDIO_SESSION_TIMEOUT="0" \
    singularity exec \
        -B .:/home/rstudio/crowley-visium-EC-stim \
        crowley-visium-ec-stim.simg rserver --www-address=127.0.0.1 --www-port=$2
fi
