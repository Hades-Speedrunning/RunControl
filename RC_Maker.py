#!/usr/bin/env python3
import tkinter as tk
from tkinter import ttk, messagebox, filedialog
from sys import argv

RC_VERSION = "1.2.2"
RC_DEFAULT_RUN_NAME = "ExampleRun"
RC_DEFAULT_DESC = ""

# clargs
for elem in argv:
    prefix: str

    prefix = "-n"
    if elem.startswith(prefix):
        RC_DEFAULT_RUN_NAME = elem[len(prefix):]

    prefix = "-v"
    if elem.startswith(prefix):
        RC_VERSION = elem[len(prefix):]

    prefix = "-d"
    if elem.startswith(prefix):
        RC_DEFAULT_DESC = elem[len(prefix):]

# RunControl schema
SCHEMA: dict[str, dict] = {
    "startingReward": {
        "type": "dict",
        "fields": {
            "Reward": {"type": "enum", "choices": [
                "Boon", "DaedalusHammer", "CharonsObol", "CentaurHeart",
                "Darkness", "Gemstones", "Key", "Nectar", "PomOfPower",
            ]},
            "AlwaysEligible": {"type": "bool"},
        }
    },
    "encounter": {
        "type": "dict",
        "fields": {
            "Name": {"type": "enum", "choices": [
                "", "SurvivalTartarus", "ThanatosTartarus", "ThanatosAsphodel",
                "ThanatosElysium", "ThanatosStyx"
            ]},
            "Waves": {
                "type": "list",
                "item": {
                    "type": "list",
                    "item": {
                        "type": "dict",
                        "fields": {
                            "Enemy": {"type": "text"},
                            "Num": {"type": "number_optional"}
                        }
                    }
                }
            }
        }
    },
    "roomFeatures": {
        "type": "dict",
        "fields": {
            "Flipped": {"type": "bool"},
            "ChaosGate": {
                "type": "dict",
                "fields": {
                    "Force": {"type": "bool"},
                    "RoomName": {"type": "text"}
                }
            },
            "ErebusGate": {
                "type": "dict",
                "fields": {
                    "Force": {"type": "bool"}
                }
            },
            "Well": {"type": "dict", "fields": {"Force": {"type": "bool"}}},
            "SellWell": {"type": "dict", "fields": {"Force": {"type": "bool"}}},
            "Trove": {"type": "dict", "fields": {"Force": {"type": "bool"}}},
            "FishingPoint": {"type": "dict", "fields": {"Force": {"type": "bool"}}},
            "GoldPotNum": {"type": "number_optional"}
        }
    },
    "boonMenu": {
        "type": "list",
        "item": {
            "type": "dict",
            "fields": {
                "Name": {"type": "text"},
                "ForcedRarity": {"type": "enum", "choices": ["", "Common", "Rare", "Epic", "Legendary"]},
                "Replace": {"type": "bool"},
                "EmptySlot": {"type": "bool"},
                "AlwaysEligible": {"type": "bool"},

                # Chaos-specific
                "CurseName": {"type": "text"},
                "BlessingName": {"type": "text"},
                "CurseLength": {"type": "number_optional"},
                "CurseValue": {"type": "number_optional"},
                "BlessingValue": {"type": "number_optional"},
            }
        },
        "supports_reroll": True  # allow subindex [rerollNum]
    },
    "exitDoors": {
        "type": "list",
        "item": {
            "type": "dict",
            "fields": {
                "RoomName": {"type": "text"},
                "Reward": {"type": "enum", "choices": [
                    "", "Boon", "DaedalusHammer", "CharonsObol", "CentaurHeart",
                    "Darkness", "Gemstones", "Key", "Nectar", "PomOfPower", "Story",
                    "Shop", "Fountain", "Erebus"
                ]},
                "GodName": {"type": "text"},
                "AlwaysEligible": {"type": "bool"},
                "ForcedRooms": {"type": "text"},
                "EligibleRooms": {"type": "text"},
            }
        }
    },
    "shop": {
        "type": "list",
        "item": {
            "type": "dict",
            "fields": {
                "Item": {"type": "enum", "choices": [
                    "", "Boon", "RandomBag", "DaedalusHammer", "Hermes",
                    "Food", "Darkness", "Gemstones", "CentaurHeart", "PomOfPower",
                    "KissOfStyx", "FatefulTwist", "AetherNet"
                ]},
                "Contents": {"type": "text"},
                "GodName": {"type": "text"},
                "EmptySlot": {"type": "bool"},
                "AlwaysEligible": {"type": "bool"},
            }
        },
        "supports_reroll": True
    },
    "sellWell": {
        "type": "list",
        "item": {
            "type": "dict",
            "fields": {
                "Name": {"type": "text"},
                "Value": {"type": "number_optional"},
                "EmptySlot": {"type": "bool"},
            }
        }
    },
    "lernieEncounter": {
        "type": "dict",
        "fields": {
            "MainHead": {"type": "text"},
            "SideHeads": {
                "type": "list",
                "item": {"type": "text"}
            }
        }
    }
}

# commonly used
DEFAULT_INDEXED_BY: list[str] = [
    "chamberNum",
    "dataType",
    "rerollNum"
    ]

# utility
def safe_number(value) -> None | float | int:
    if value is None:
        return None
    s: str = str(value).strip()
    if s == "":
        return None
    try:
        if "." in s:
            return float(s)
        return int(s)
    except ValueError:
        return None

def lua_string(s: str) -> str:
    return f"\"{s}\""

def lua_bool(b: bool) -> str:
    return "true" if b else "false"

def indent(level: int) -> str:
    return "    " * level

def serialize_value(v, level: int = 0) -> str:
    if isinstance(v, dict):
        lines = ["{"]
        for i, (k, val) in enumerate(v.items()):
            lines.append(f"{indent(level+1)}{k} = {serialize_value(val, level+1)},")
        lines.append(f"{indent(level)}}}")
        return "\n".join(lines)
    
    elif isinstance(v, list):
        lines: list[str] = ["{"]
        for item in v:
            lines.append(f"{indent(level+1)}{serialize_value(item, level+1)},")
        lines.append(f"{indent(level)}}}")
        return "\n".join(lines)
    
    elif isinstance(v, str):
        return lua_string(v)
    
    elif isinstance(v, bool):
        return lua_bool(v)
    
    elif v is None: # empty
        return "nil"
    
    else: # other
        return str(v)

def prune_nils(obj) -> list | dict:
    # remove None fields. lists keep their items, dicts drop None values
    if isinstance(obj, dict):
        return {k: prune_nils(v) for k, v in obj.items() if v is not None}
    
    elif isinstance(obj, list):
        return [prune_nils(v) for v in obj]
    
    else: # non-iterable types are trivially non-None
        return obj

# UI
class FieldEditor(tk.Frame):
    """
    edit according to the schema
    types: dict, list, enum, bool, text, number_optional
    """

    def __init__(self, master, schema_node, initial = None) -> None:
        super().__init__(master)
        self.schema = schema_node
        self.value: tk.StringVar | tk.BooleanVar | dict | None = None
        self.widgets: list = []
        self.build(initial)

    def build(self, initial) -> None:
        t: str = self.schema.get("type")
        if t == "dict":
            self.value = {}
            row: int = 0
            for key, field_schema in self.schema.get("fields", {}).items():
                lbl: ttk.Label = ttk.Label(self, text = key)
                init_sub: tk.StringVar | tk.BooleanVar | dict | None = None if initial is None else initial.get(key)
                editor: FieldEditor = FieldEditor(self, field_schema, init_sub)

                lbl.grid(row = row, column = 0, sticky = "w", padx = 4, pady = 2)
                editor.grid(row = row, column = 1, sticky = "w", padx = 4, pady = 2)
                self.widgets.append((key, editor))
                row += 1

        elif t == "list":
            # List editor: add/remove items
            self.items_frame: ttk.Frame = ttk.Frame(self)
            self.controls: ttk.Frame = ttk.Frame(self)
            self.add_btn: ttk.Button = ttk.Button(self.controls, text = "Add", command = self.add_item)
            self.remove_btn: ttk.Button = ttk.Button(self.controls, text = "Remove last", command = self.remove_last)

            self.items_frame.grid(row = 0, column = 0, sticky = "w")
            self.controls.grid(row = 1, column = 0, sticky = "w", pady = 4)
            self.add_btn.grid(row = 0, column = 0, padx = 2)
            self.remove_btn.grid(row = 0, column = 1, padx = 2)

            self.list_items: list = []
            initial_list: list = initial if isinstance(initial, list) else []

            for item_init in initial_list:
                self.add_item(item_init)

        elif t == "enum":
            choices = self.schema.get("choices", [])
            var = tk.StringVar(value = (initial if initial is not None else (choices[0] if choices else ""))) # not clean but whatever
            cmb: ttk.Combobox = ttk.Combobox(self, values = choices, textvariable = var, state = "readonly")
            self.value = var

            cmb.grid(row = 0, column = 0, sticky = "w")
            self.widgets.append(cmb)

        elif t == "bool":
            var = tk.BooleanVar(value = bool(initial) if initial is not None else False)
            chk: ttk.Checkbutton = ttk.Checkbutton(self, variable = var)
            self.value = var

            chk.grid(row = 0, column = 0, sticky = "w")
            self.widgets.append(chk)

        elif t == "text":
            var = tk.StringVar(value = initial if initial is not None else "")
            ent: ttk.Entry = ttk.Entry(self, textvariable = var, width = 24)
            self.value = var

            ent.grid(row = 0, column = 0, sticky = "w")
            self.widgets.append(ent)

        elif t == "number_optional":
            var = tk.StringVar(value = str(initial) if initial is not None else "")
            ent: ttk.Entry = ttk.Entry(self, textvariable = var, width = 12)
            self.value = var

            ent.grid(row = 0, column = 0, sticky = "w")
            self.widgets.append(ent)

        else:
            lbl: ttk.Label = ttk.Label(self, text=f"Unsupported type: {t}")
            lbl.grid(row = 0, column = 0, sticky = "w")

    def add_item(self, item_init = None) -> None:
        item_schema: dict[str, dict] = self.schema.get("item")
        idx: int = len(self.list_items)
        row_frame: ttk.Frame = ttk.Frame(self.items_frame)
        editor: FieldEditor = FieldEditor(row_frame, item_schema, item_init)

        row_frame.grid(row = idx, column = 0, sticky = "w")
        editor.grid(row = 0, column = 0, sticky = "w", padx = 2, pady = 2)
        self.list_items.append(editor)

    def remove_last(self) -> None:
        if self.list_items:
            editor: FieldEditor = self.list_items.pop()
            editor.destroy()

    def get_value(self) -> dict | list["FieldEditor"] | float | str | None:
        t = self.schema.get("type")
        if t == "dict":
            out: dict = {}
            for key, editor in self.widgets:
                val: dict | list[FieldEditor] | float | str | None = editor.get_value()
                # drop None
                if val is not None:
                    out[key] = val
            return out

        elif t == "list":
            return [editor.get_value() for editor in self.list_items]
        
        # my typechecker is unhappy (hence the type: ignore) because self.value can have multiple types and not all of them allow for .get(), but it works
        elif t == "enum":
            return self.value.get() # type: ignore

        elif t == "bool":
            return bool(self.value.get()) # type: ignore

        elif t == "text":
            s: str = self.value.get().strip() # type: ignore
            return s if s != "" else None

        elif t == "number_optional":
            return safe_number(self.value.get()) # type: ignore

        else:
            return None # no value / field does not exist

# -------------------------
# Chamber editor
# -------------------------
class DataTypeEditor(tk.Frame):
    """
    Editor for one selected dataType in a chamber, including reroll support when applicable.
    """
    def __init__(self, master: ttk.Frame, dtype: str) -> None:
        super().__init__(master, borderwidth = 1, relief = "groove")
        self.dtype: str = dtype
        lbl: ttk.Label = ttk.Label(self, text = dtype, font = ("Segoe UI", 10, "bold"))
        self.reroll_supported: dict[str, dict] = SCHEMA.get(dtype, {}).get("supports_reroll", False)
        self.use_reroll: tk.BooleanVar = tk.BooleanVar(value = False)
        self.editor: FieldEditor = FieldEditor(self, SCHEMA[dtype])
        if self.reroll_supported:
            rr_chk = ttk.Checkbutton(self, text = "Index by rerollNum", variable = self.use_reroll)
        
        lbl.grid(row = 0, column = 0, sticky = "w", padx = 4, pady = 2)
        if self.reroll_supported:
            rr_chk.grid(row = 0, column = 1, sticky = "w", padx = 4)

        self.editor.grid(row = 1, column = 0, columnspan = 2, sticky = "w", padx = 4, pady = 4)

    def get_struct(self) -> dict:
        """
        Returns either:
        - { dtype: { Data = <value> } } for no reroll on-route
        - { dtype: { [rerollNum] = { Data = <value> } } } to set post-reroll menu-options
        """
        data_val_pre: dict | list | float | str | None = self.editor.get_value()
        data_val: list | dict = prune_nils(data_val_pre)

        if self.use_reroll.get() and self.reroll_supported:
            return {
                self.dtype: {
                    1: {"Data": data_val}
                }
            }
        else:
            return {
                self.dtype: {"Data": data_val}
            }

class ChamberPanel(tk.Frame):
    def __init__(self, master: ttk.Frame) -> None:
        super().__init__(master)

        # Top-left chamber entry
        self.chamber_number: ttk.Label = ttk.Label(self, text = "Chamber number")
        self.chamber_var: tk.IntVar = tk.IntVar(value = 1)
        self.chamber_entry: ttk.Entry = ttk.Entry(self, textvariable = self.chamber_var, width = 8)

        # dropdown to add properties for a given room
        self.add_d_type: ttk.Label = ttk.Label(self, text = "Add data type")
        self.dtype_var: tk.StringVar = tk.StringVar(value = "")
        dtype_choices: list[str] = ["", "startingReward", "boonMenu", "exitDoors", "encounter", "roomFeatures", "shop", "sellWell", "lernieEncounter"]
        self.dtype_combo: ttk.Combobox = ttk.Combobox(self, values = dtype_choices, textvariable = self.dtype_var, state = "readonly", width = 24)
        self.add_btn: ttk.Button = ttk.Button(self, text = "Add", command = self.add_dtype)

        # container for dtype editors (to the right and down)
        self.editors_frame = ttk.Frame(self)
        self.dtype_editors: dict[str, DataTypeEditor] = {}

        self.chamber_number.grid(row = 0, column = 0, sticky = "w", padx = 4, pady = 2)
        self.chamber_entry.grid(row = 0, column = 1, sticky = "w", padx = 4, pady = 2)
        self.add_d_type.grid(row = 1, column = 0, sticky = "w", padx = 4, pady = 2)
        self.dtype_combo.grid(row = 1, column = 1, sticky = "w", padx = 4, pady = 2)
        self.add_btn.grid(row = 1, column = 2, sticky = "w", padx = 4)
        self.editors_frame.grid(row = 2, column = 0, columnspan = 3, sticky = "nw", padx = 4, pady = 6)

    def add_dtype(self) -> None:
        dtype: str = self.dtype_var.get().strip()

        if not dtype:
            return
        if dtype in self.dtype_editors:
            messagebox.showinfo("Already added", f"{dtype} is already present in this chamber.")
            return
        
        editor: DataTypeEditor = DataTypeEditor(self.editors_frame, dtype)
        row: int = len(self.dtype_editors)
        self.dtype_editors[dtype] = editor

        editor.grid(row = row, column = 0, sticky = "w", padx = 4, pady = 4)

    def get_chamber_struct(self) -> tuple[int, dict]:
        """
        Returns chamber struct looks a bit like:
        {
          [chamberNum]: {
            property 2 = nested tables describing the property
            property 1 = nested tables describing the property
            ...
          }
        }
        """

        out: dict[int, dict] = {}
        for dtype, editor in self.dtype_editors.items():
            out.update(editor.get_struct())
        
        return self.chamber_var.get(), out

# -------------------------
# Main application
# -------------------------
class RunBuilderApp(tk.Tk):
    def __init__(self) -> None:
        super().__init__()
        self.title("RunControl Route Builder")
        self.geometry("1100x700")

        # Metadata
        meta_frame: ttk.LabelFrame = ttk.LabelFrame(self, text = "Metadata")
        meta_frame.pack(side = "top", fill = "x", padx = 8, pady = 6)
        self.name_var: tk.StringVar = tk.StringVar(value = RC_DEFAULT_RUN_NAME)
        self.desc_var: tk.StringVar = tk.StringVar(value = RC_DEFAULT_DESC)
        self.time_var: tk.StringVar = tk.StringVar(value = "")
        self.heat_var: tk.StringVar = tk.StringVar(value = "")
        self.version_var: tk.StringVar = tk.StringVar(value = RC_VERSION)

        row = 0
        ttk.Label(meta_frame, text = "Name").grid(row = row, column = 0, sticky = "w", padx = 4, pady = 2)
        ttk.Entry(meta_frame, textvariable = self.name_var, width = 30).grid(row = row, column = 1, sticky = "w", padx = 4, pady = 2)
        ttk.Label(meta_frame, text = "Description").grid(row = row, column = 2, sticky = "w", padx = 4, pady = 2)
        ttk.Entry(meta_frame, textvariable = self.desc_var, width = 50).grid(row = row, column = 3, sticky = "w", padx = 4, pady = 2)

        row += 1
        ttk.Label(meta_frame, text = "OriginalTime").grid(row = row, column = 0, sticky = "w", padx = 4, pady = 2)
        ttk.Entry(meta_frame, textvariable = self.time_var, width = 20).grid(row = row, column = 1, sticky = "w", padx = 4, pady = 2)
        ttk.Label(meta_frame, text = "OriginalHeat").grid(row = row, column = 2, sticky = "w", padx = 4, pady = 2)
        ttk.Entry(meta_frame, textvariable = self.heat_var, width = 10).grid(row = row, column = 3, sticky = "w", padx = 4, pady = 2)

        row += 1
        ttk.Label(meta_frame, text = "CreatedFor").grid(row = row, column = 0, sticky = "w", padx = 4, pady = 2)
        ttk.Entry(meta_frame, textvariable = self.version_var, width = 20).grid(row = row, column = 1, sticky = "w", padx = 4, pady = 2)

        # IndexedBy config
        index_frame: ttk.LabelFrame = ttk.LabelFrame(self, text = "IndexedBy")
        self.idx_chamber: tk.BooleanVar = tk.BooleanVar(value = True)
        self.idx_datatype: tk.BooleanVar = tk.BooleanVar(value = True)
        self.idx_reroll: tk.BooleanVar = tk.BooleanVar(value = True)

        index_frame.pack(side = "top", fill = "x", padx = 8, pady = 6)
        ttk.Checkbutton(index_frame, text = "chamberNum", variable=self.idx_chamber).grid(row = 0, column = 0, sticky = "w", padx = 4)
        ttk.Checkbutton(index_frame, text = "dataType", variable=self.idx_datatype).grid(row = 0, column = 1, sticky = "w", padx = 4)
        ttk.Checkbutton(index_frame, text = "rerollNum", variable=self.idx_reroll).grid(row = 0, column = 2, sticky = "w", padx = 4)

        # Chambers list
        chambers_frame: ttk.LabelFrame = ttk.LabelFrame(self, text = "Chambers")
        self.canvas: tk.Canvas = tk.Canvas(chambers_frame, bg = self.cget("bg"))
        self.scrollbar: ttk.Scrollbar = ttk.Scrollbar(chambers_frame, orient = "vertical", command = self.canvas.yview)

        chambers_frame.pack(side = "left", fill = "both", expand = True, padx = 8, pady = 8)
        self.canvas.configure(yscrollcommand = self.scrollbar.set)
        self.canvas.pack(side = "left", fill = "both", expand = True)
        self.scrollbar.pack(side = "right", fill = "y")

        self.chambers_container: ttk.Frame = ttk.Frame(self.canvas)
        self.canvas.create_window((0,0), window = self.chambers_container, anchor = "nw")
        self.chambers_container.bind("<Configure>", lambda e: self.canvas.configure(scrollregion = self.canvas.bbox("all")))
        self.chamber_panels: list[ChamberPanel] = []

        controls: ttk.Frame = ttk.Frame(chambers_frame)
        controls.pack(side = "bottom", fill = "x")
        ttk.Button(controls, text = "Add chamber", command = self.add_chamber).pack(side = "left", padx = 4)
        ttk.Button(controls, text = "Remove last chamber", command = self.remove_last_chamber).pack(side = "left", padx = 4)

        # Export
        export_frame: ttk.LabelFrame = ttk.LabelFrame(self, text = "Export")
        export_frame.pack(side = "right", fill = "y", padx = 8, pady = 8)
        ttk.Label(export_frame, text = "Run name").pack(anchor = "w", padx = 4, pady = 2)

        self.run_name_var: tk.StringVar = tk.StringVar(value = RC_DEFAULT_RUN_NAME)
        ttk.Entry(export_frame, textvariable = self.run_name_var, width = 24).pack(anchor = "w", padx = 4, pady = 2)

        ttk.Button(export_frame, text = "Export Lua...", command = self.export_lua).pack(anchor = "w", padx = 4, pady = 8)

        self.add_chamber() # C1 added by default

    def add_chamber(self) -> None:
        panel: ChamberPanel = ChamberPanel(self.chambers_container)
        panel.pack(side = "top", anchor = "w", fill = "x", pady = 6)
        self.chamber_panels.append(panel)

    def remove_last_chamber(self) -> None:
        if self.chamber_panels:
            panel: ChamberPanel = self.chamber_panels.pop()
            panel.destroy()

    def get_indexed_by(self) -> list[str]:
        ix: list[str] = []
        if self.idx_chamber.get():
            ix.append("chamberNum")
        if self.idx_datatype.get():
            ix.append("dataType")
        if self.idx_reroll.get():
            ix.append("rerollNum")
        if not ix:
            ix = DEFAULT_INDEXED_BY[:] # failsafe
        return ix

    def export_lua(self) -> None:
        # build structure
        run_name: str = self.run_name_var.get().strip()
        if not run_name:
            messagebox.showerror("Missing run name", "Please provide a run name.")
            return

        meta: dict[str, dict | str] = {}
        if self.name_var.get().strip():
            meta["Name"] = self.name_var.get().strip()
        if self.desc_var.get().strip():
            meta["Description"] = self.desc_var.get().strip()
        if self.time_var.get().strip():
            meta["OriginalTime"] = self.time_var.get().strip()
        if self.heat_var.get().strip():
            # kept as string, but Hades shows this as a number
            meta["OriginalHeat"] = self.heat_var.get().strip()
        if self.version_var.get().strip():
            meta["CreatedFor"] = self.version_var.get().strip()

        indexed_by: list[str] = self.get_indexed_by()

        # chambers
        list_table: dict = {}
        for panel in self.chamber_panels:
            chamber_num, chamber_struct = panel.get_chamber_struct()
            if chamber_num <= 0:
                messagebox.showerror("Invalid chamber", f"Chamber number {chamber_num} must be strictly positive.")
                return
            list_table[chamber_num] = chamber_struct

        # serialize Lua
        lines: list = []
        lines.append(f"RunControl.Runs.{run_name} = " + "{")
        if meta:
            lines.append(f"{indent(1)}Metadata = " + "{")
            for k, v in meta.items():
                val = v if isinstance(v, str) else str(v)
                lines.append(f"{indent(2)}{k} = {lua_string(val)},")
            lines.append(f"{indent(1)}}},")
        # IndexedBy
        lines.append(f"{indent(1)}IndexedBy = " + "{ " + ", ".join([lua_string(k) for k in indexed_by]) + " },")
        # List
        lines.append(f"{indent(1)}List = " + "{")
        # chambers (output sorted for user-readability)
        for chamber in sorted(list_table.keys()):
            lines.append(f"{indent(2)}[{chamber}] = " + "{")
            chamber_dict = list_table[chamber]
            # each dataType
            for dtype, payload in chamber_dict.items():
                lines.append(f"{indent(3)}{dtype} = " + "{")
                # either { Data = ... } or { [1] = { Data = ... } }
                if "Data" in payload:
                    lines.append(f"{indent(4)}Data = {serialize_value(payload['Data'], 4)},")
                else:
                    # subtables indexed (e.g., rerollNum)
                    for subk, subv in payload.items():
                        lines.append(f"{indent(4)}[{subk}] = " + "{")
                        lines.append(f"{indent(5)}Data = {serialize_value(subv['Data'], 5)},")
                        lines.append(f"{indent(4)}}},")
                lines.append(f"{indent(3)}}},")
            lines.append(f"{indent(2)}}},")
        lines.append(f"{indent(1)}}},")
        lines.append("}")

        lua_text = "\n".join(lines)

        # Save
        file_path: str = filedialog.asksaveasfilename(
            title = "Save Lua run",
            confirmoverwrite = True,
            defaultextension = ".lua",
            filetypes = [("Lua files", "*.lua"), ("All files", "*.*")],
            initialfile = f"{run_name}.lua"
        )

        if not file_path:
            return
        
        try:
            with open(file_path, "w", encoding = "utf-8") as f:
                f.write(lua_text)

            messagebox.showinfo("Exported", f"Saved Lua run to:\n{file_path}")

        except Exception as e:
            messagebox.showerror("Error", f"Failed to save file:\n{e}")

if __name__ == "__main__":
    app: RunBuilderApp = RunBuilderApp()
    app.mainloop()
