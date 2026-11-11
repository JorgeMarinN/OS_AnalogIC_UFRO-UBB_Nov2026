# ---------------------------------------------------------------------
#  SG13G2 macro – custom polygons + import of sg13g2_inv_1 from library
# ---------------------------------------------------------------------
import pya

# ---------- 1. Context ------------------------------------------------
app     = pya.Application.instance()
layout  = app.main_window().current_view().active_cellview().layout()
top     = layout.top_cell()
dbu     = layout.dbu                     # 1 nm with the open PDK

# ---------- 2. Layer handles (unchanged from previous script) ---------
L_ACTIV      = layout.layer(pya.LayerInfo(1,  0))   # Activ:drawing
L_PSD        = layout.layer(pya.LayerInfo(14, 0))   # pSD:drawing
L_CONT       = layout.layer(pya.LayerInfo(6,  0))   # Cont:drawing
L_M1         = layout.layer(pya.LayerInfo(8,  0))   # Metal1:drawing
L_M1_PIN     = layout.layer(pya.LayerInfo(8,  2))   # Metal1:pin

# ---------- 3. Helpers ------------------------------------------------
def um2dbu(v_um: float) -> int:
    return int(v_um / dbu)

def add_box(layer, x1_um, y1_um, x2_um, y2_um):
    box = pya.Box(um2dbu(x1_um), um2dbu(y1_um),
                  um2dbu(x2_um), um2dbu(y2_um))
    top.shapes(layer).insert(box)

# ---------- 4. Your custom geometry ----------------------------------
# Example Metal-1 rectangle from the earlier code
#add_box(L_M1, 6.67000, -0.32000, 6.83000, 0.92000)

# Four identical rectangles on several layers
#common = dict(x1_um=6.59000, y1_um=-0.47500,
#              x2_um=6.91000, y2_um=-0.15500)
#for layer in (L_ACTIV, L_PSD, L_M1, L_M1_PIN):
#    add_box(layer, **common)

# Contact window
#add_box(L_CONT, 6.67000, -0.39500, 6.83000, -0.23000)

# ---------- 5. Import the standard-cell GDS ---------------------------
stdcell_gds = "/opt/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/gds/sg13g2_stdcell.gds"

opt = pya.LoadLayoutOptions()
opt.keep_cells  = True     # merge instead of replacing
opt.dbu         = dbu      # force same database unit (usually 0.001 µm)

layout.read(stdcell_gds, opt)   # cells are now part of this layout

# ---------- 6. Place sg13g2_dlygate4sd3_1 instance ----------------------------
dly_cell = layout.cell("sg13g2_dlygate4sd3_1")
if dly_cell is None:
    raise RuntimeError("Cell 'sg13g2_dlygate4sd3_1' not found in the library GDS.")

# Choose insertion point (in µm) – change as needed
x_um, y_um = 1.0, 1.0
trans = pya.Trans(pya.Vector(um2dbu(x_um), um2dbu(y_um)))

# Add a single instance (no array) to the top cell
top.insert(pya.CellInstArray(dly_cell.cell_index(), trans))

# Choose SECOND insertion point (in µm) – change as needed
x2_um, y2_um = 5.32, 1.0
trans2 = pya.Trans(pya.Vector(um2dbu(x2_um), um2dbu(y2_um)))

# Add a single instance (no array) to the top cell
top.insert(pya.CellInstArray(dly_cell.cell_index(), trans2))

# Choose THIRD insertion point (in µm) – change as needed
x3_um, y3_um = 9.64, 1.0
trans3 = pya.Trans(pya.Vector(um2dbu(x3_um), um2dbu(y3_um)))

# Add a single instance (no array) to the top cell
top.insert(pya.CellInstArray(dly_cell.cell_index(), trans3))

# ---------- 7. (Optional) Save result --------------------------------
#layout.write("updated_with_dly.gds")
print("Layout updated – sg13g2_dlygate4sd3_1 placed at ({:.3f}, {:.3f}), ({:.3f}, {:.3f}) and ({:.3f}, {:.3f}) µm".format(x_um, y_um,x2_um, y2_um,x3_um, y3_um))

# Enter your Python code here


