#!/usr/bin/env python3
"""Helper to convert Drive file-listing JSON into ledger CSV rows.
Usage: python3 _helper.py <folder_path> < files.json >> ledger_raw.csv
Reads JSON {"files":[...]} from stdin, appends rows (no header) for non-folder entries.
Prints folder entries found (id, title) to stderr for tracking/recursion.
"""
import sys, json, csv

MIME_MAP = {
    "application/vnd.google-apps.folder": "folder",
    "application/vnd.google-apps.document": "gdoc",
    "application/vnd.google-apps.spreadsheet": "gsheet",
    "application/vnd.google-apps.presentation": "gslides",
    "application/vnd.google-apps.shortcut": "shortcut",
    "application/pdf": "pdf",
    "text/plain": "text",
    "text/markdown": "markdown",
    "text/html": "html",
    "application/json": "json",
    "image/png": "image",
    "image/jpeg": "image",
    "image/svg+xml": "image",
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document": "docx",
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet": "xlsx",
    "application/vnd.openxmlformats-officedocument.presentationml.presentation": "pptx",
    "application/octet-stream": "binary",
    "application/zip": "zip",
}

def sanitize_cell(value):
    """Prefix values that would be interpreted as formulas by spreadsheet
    apps (Excel/Sheets) when this CSV is opened, since titles originate
    from Drive file metadata we don't control."""
    if value and value[0] in ("=", "+", "-", "@"):
        return "'" + value
    return value

def simplify(mime):
    if mime in MIME_MAP:
        return MIME_MAP[mime]
    if mime.startswith("image/"):
        return "image"
    if mime.startswith("video/"):
        return "video"
    if mime.startswith("audio/"):
        return "audio"
    return f"other:{mime}"

def main():
    folder_path = sys.argv[1] if len(sys.argv) > 1 else ""
    data = json.load(sys.stdin)
    files = data.get("files", [])
    writer = csv.writer(sys.stdout, quoting=csv.QUOTE_MINIMAL)
    folder_count = 0
    file_count = 0
    folders_found = []
    for f in files:
        mime = f.get("mimeType", "")
        title = f.get("title", "")
        fid = f.get("id", "")
        mtime = f.get("modifiedTime", "")
        if mime == "application/vnd.google-apps.folder":
            folder_count += 1
            folders_found.append((fid, title))
            continue
        ftype = simplify(mime)
        notes = "shortcut, not followed" if mime == "application/vnd.google-apps.shortcut" else ""
        writer.writerow([sanitize_cell(title), ftype, folder_path, fid, mtime, "TBD", "TBD", "1", notes])
        file_count += 1
    sys.stderr.write(f"FILE_COUNT={file_count}\n")
    sys.stderr.write(f"FOLDER_COUNT={folder_count}\n")
    for fid, title in folders_found:
        sys.stderr.write(f"FOLDER\t{fid}\t{title}\n")

if __name__ == "__main__":
    main()
