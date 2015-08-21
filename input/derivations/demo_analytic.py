#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function, division, absolute_import

import argh

import time
import numpy as np
import matplotlib.pyplot as plt

from _analytic import rev_binary_K_eq

def main(gui=False):
    cb = rev_binary_K_eq
    if gui:
        from enthought.chaco.api import ArrayPlotData, Plot
        from enthought.chaco.tools.api import PanTool, ZoomTool
        from enthought.enable.component_editor import ComponentEditor
        from enthought.traits.api import HasTraits, Instance, Array, Property, Range, Float, Enum
        from enthought.traits.ui.api import Item, View

        class MyViewer(HasTraits):

            plot = Instance(Plot)
            plotdata = Instance(ArrayPlotData, args=())

            t = Array
            x = Property(Array, depends_on = ['Y', 'Z', 'k_f', 'K_eq'])
            Y = Range(low = 11e-3, high = 0.1, value = 20e-3)
            Z = Range(low = .5e-3, high = 10e-3, value = 2e-3)
            k_f = Range(low = 15.0, high = 150.0, value = 100.0)
            K_eq = Range(low = 0.1, high = 100.0, value = 10.0)
            plot_type = Enum("line", "scatter")

            traits_view = View(
                Item('plot', editor=ComponentEditor(),
                     show_label=False),
                Item(name = 'Y'),
                Item(name = 'Z'),
                Item(name = 'k_f'),
                Item(name = 'K_eq'),
                Item(name = 'plot_type'),
                width = 600,
                height = 800,
                resizable = True,
                title = "Stopped flow model",
                )

            def _plot_default(self):
                plot = Plot(self.plotdata)
                self.plotdata.set_data('t', self.t)
                self.plotdata.set_data('x', self.x)
                plot.plot(('t', 'x'), color = 'red', type_trait="plot_type", name = 'x')
                plot.legend.visible = True
                plot.title = "Stopped flow"
                plot.x_axis.title = 't'

                # Add pan and zoom to the plot
                plot.tools.append(PanTool(plot, constrain_key="shift"))
                zoom = ZoomTool(plot)
                plot.overlays.append(zoom)
                return plot

            def _get_x(self):
                return cb(self.t, self.Y, self.Z, self.k_f, self.K_eq)

            def _x_changed(self):
                self.plotdata.set_data('x', self.x)

            def _t_default(self):
                return self.t_default

            def __init__(self, y0, params, t0, tend):
                for k, v in y0.items():
                    if hasattr(self, k):
                        setattr(self, k, v)
                    else:
                        raise AttributeError('No init cond. {}'.format(k+'0'))
                for k, v in params.items():
                    if hasattr(self, k):
                        setattr(self, k, v)
                    else:
                        raise AttributeError('No param {}'.format(k))
                self.t_default = np.linspace(t0, tend, 2048)
                super(MyViewer, self).__init__()

            @property
            def depv_init(self):
                return {'u': self.u0, 'v': self.v0}

            @property
            def params(self):
                return {'mu': self.mu}

        viewer = MyViewer({'Y': 20e-3, 'Z': 2e-3}, {'k_f': 107, 'K_eq': 11.3}, t0=0, tend=3.0)
        viewer.configure_traits()

    else:
        tplot = np.linspace(0,3, 1024)
        texec = time.time()
        yplot = rev_binary_K_eq(tplot, 20e-3, 2e-3, 110, 10)
        texec = time.time()-texec
        print(texec)
        plt.plot(tplot, yplot)
        plt.show()


if __name__ == '__main__':
    argh.dispatch_command(main)
