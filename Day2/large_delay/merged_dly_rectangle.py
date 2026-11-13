# ------------------------------------------------------------
# KLayout Python macro: SG13G2 delay gates + Metal1 rectangle
# ------------------------------------------------------------
import pya

# Active layout and cell (works with multiple top-level cells)
app = pya.Application.instance()
view = app.main_window().current_view()
if view is None:
    raise RuntimeError('No active KLayout view found.')
cv = view.active_cellview()
if cv is None or cv.cell is None:
    raise RuntimeError('No active cell found.')
layout = cv.layout()
top = cv.cell
dbu = layout.dbu

# IHP SG13G2 layer definitions
L_ACTIV = layout.layer(pya.LayerInfo(1, 0))
L_PSD = layout.layer(pya.LayerInfo(14, 0))
L_CONT = layout.layer(pya.LayerInfo(6, 0))
L_M1 = layout.layer(pya.LayerInfo(8, 0))
L_M1_PIN = layout.layer(pya.LayerInfo(8, 2))

def um2dbu(value):
    return round(value / dbu)

def add_box(layer, x1, y1, x2, y2):
    box = pya.Box(um2dbu(x1), um2dbu(y1),
                  um2dbu(x2), um2dbu(y2))
    top.shapes(layer).insert(box)

# Import standard-cell library if the target cell is not already loaded.
stdcell_gds = '/opt/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/gds/sg13g2_stdcell.gds'
cell_name = 'sg13g2_dlygate4sd3_1'
dly_cell = layout.cell(cell_name)
if dly_cell is None:
    opt = pya.LoadLayoutOptions()
    opt.keep_cells = True
    opt.dbu = dbu
    layout.read(stdcell_gds, opt)
    dly_cell = layout.cell(cell_name)
if dly_cell is None:
    raise RuntimeError("Cell '{}' not found in standard-cell GDS.".format(cell_name))

# Place three delay gates
positions_um = [(1.0, 1.0), (5.32, 1.0), (9.64, 1.0)]
for x_um, y_um in positions_um:
    trans = pya.Trans(pya.Vector(um2dbu(x_um), um2dbu(y_um)))
    top.insert(pya.CellInstArray(dly_cell.cell_index(), trans))

# Metal1 rectangle (8/0)
add_box(L_M1, 5.020, 2.410, 5.605, 3.080)

# Make newly added layers visible. No LayoutView.update() call.
view.add_missing_layers()

print('Placed {} delay gates and one Metal1 rectangle in cell {}.'.format(
    len(positions_um), top.name))
print('Metal1 box: (5.020, 2.410) to (5.605, 3.080) um')
