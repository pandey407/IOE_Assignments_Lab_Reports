# -*- coding: utf-8 -*-

"""
Display the poles and zeros of discrete-time systems.
fig = zplane(z, p, ax=None) plots the zeros and poles specified in z and p, respectively.
The current window axis can be given as argument for inclusion as a subplot.
The symbol 'o' and 'x' represents a zero and a pole, respectively.
The plot includes the axes and the unit circle for reference.
"""

# Copyright (c) 2011 Christopher Felton
# 2015-02: modified by Marc Evrard
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# The following is derived from the slides presented by
# Alexander Kain for CS506/606 "Special Topics: Speech Signal Processing"
# CSLU / OHSU, Spring Term 2011.
# 
# Code inspired by 
# http://scipy-central.org/item/52/1/zplane-function
# and
# http://www.dsprelated.com/showcode/244.php


import numpy as np
import matplotlib.pyplot as plt
from matplotlib import patches
import collections as coll


def zplane(_zeros_arr, _poles_arr, _ax=None):
    """Plot the complex z-plane given zeros and poles."""

    _fig = None     # to avoid return warning
    # get a figure/plot
    if _ax is None:
        _fig, _ax = plt.subplots(1)

    # Add unit circle and zero axes
    unit_circle = patches.Circle((0, 0), radius=1, fill=False,
                                 color='black', ls='solid', alpha=0.1)
    _ax.add_patch(unit_circle)
    _ax.axvline(0, color='0.7')
    _ax.axhline(0, color='0.7')

    # Plot the poles and set marker properties
    poles_plt = _ax.plot(_poles_arr.real, _poles_arr.imag, 'x', markersize=9, alpha=0.5)

    # Plot the zeros and set marker properties
    zeros_plt = _ax.plot(_zeros_arr.real, _zeros_arr.imag, 'o', markersize=9, color='none', alpha=0.5,
                         markeredgecolor=poles_plt[0].get_color())      # same color as poles

    # Scale axes to fit
    r = 1.5 * np.amax(np.concatenate((abs(_zeros_arr), abs(_poles_arr), [1])))
    _ax.axis('scaled')
    _ax.axis([-r, r, -r, r])

    _ax.set_title('Poles and zeros')
    _ax.grid(True, color='0.9', linestyle='-', which='both', axis='both')

    def count_zp_multiplicity(pz_plt):
        """Count zeros and poles multiplicity"""
        # If there are multiple poles or zeros at the same point, put a superscript next to them.
        # TODO: can this be made to self-update when zoomed?
        # dict keys should be ints for matching
        # but coords should be floats for keeping location of text accurate while zooming

        # Finding duplicates by same pixel coordinates (hacky for now):
        pz_coord_xy = _ax.transData.transform(np.vstack(pz_plt[0].get_data()).T)

        d = coll.defaultdict(int)
        coords = coll.defaultdict(tuple)
        for xy in pz_coord_xy:
            key = tuple(xy.round().astype('int'))
            d[key] += 1
            coords[key] = xy
        for key, value in d.items():
            if value > 1:
                _x, _y = _ax.transData.inverted().transform(coords[key])
                _ax.text(_x, _y, r' ${}^{' + str(value) + '}$', fontsize=13)

    count_zp_multiplicity(poles_plt)
    count_zp_multiplicity(zeros_plt)

    return _fig