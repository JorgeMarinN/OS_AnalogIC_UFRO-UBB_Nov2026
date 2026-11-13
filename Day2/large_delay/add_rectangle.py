
# ------------------------------------------------------------
# KLayout Python Macro
# Draw Metal1 rectangle in IHP SG13G2
# ------------------------------------------------------------

import pya

# 1. Access active KLayout view
app = pya.Application.instance()
view = app.main_window().current_view()

if view is None:
    raise RuntimeError("No active KLayout view found.")

cv = view.active_cellview()

if cv is None or cv.cell is None:
    raise RuntimeError("No active cell found.")

# 2. Get layout and active cell
layout = cv.layout()
cell = cv.cell

# 3. Define Metal1 drawing layer (8/0)
L_M1 = layout.layer(pya.LayerInfo(8, 0))

# 4. Rectangle coordinates (micrometers)
x1, y1 = 5.020, 2.410
x2, y2 = 5.605, 3.080

# 5. Convert micrometers to database units
dbu = layout.dbu

box = pya.Box(
    round(x1 / dbu),
    round(y1 / dbu),
    round(x2 / dbu),
    round(y2 / dbu)
)

# 6. Insert rectangle into active cell
cell.shapes(L_M1).insert(box)

# 7. Ensure Metal1 layer is displayed
view.add_missing_layers()

# 8. Confirmation
print("Metal1 rectangle successfully created.")
print("Cell:", cell.name)
print("Layer: 8/0")
print("Coordinates (um):", x1, y1, x2, y2)
