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

FROM rocker/rstudio:4.2.1

LABEL maintainer="Emir Turkes emir.turkes@eturkes.com"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        zlib1g-dev \
        libxml2 \
        libglpk40 \
        libhdf5-dev \
        libgdal26 \
        libproj15 \
        libudunits2-0 \
        libcairo2-dev \
        libxt-dev \
    && Rscript \
        -e "install.packages('conflicted')" \
        -e "install.packages('rmarkdown')" \
        -e "install.packages('rprojroot')" \
        -e "install.packages('Seurat')" \
        -e "install.packages('hdf5r')" \
        -e "install.packages('spdep')" \
        -e "install.packages('statmod')" \
        -e "install.packages('DT')" \
        -e "install.packages('factoextra')" \
        -e "install.packages('pals')" \
        -e "install.packages('tm')" \
        -e "install.packages('qgraph')" \
        -e "install.packages('BiocManager')" \
        -e "BiocManager::install('DropletUtils')" \
        -e "BiocManager::install('ComplexHeatmap')" \
        -e "BiocManager::install('GSVA')" \
        -e "BiocManager::install('biomaRt')" \
        -e "BiocManager::install('scater')" \
        -e "BiocManager::install('GO.db')" \
    && apt-get clean \
    && rm -Rf \
        /var/lib/apt/lists/ \
        /tmp/downloaded_packages/ \
        /tmp/*.rds
