# Build Plan: Filterable Menu + Modal View

Plain HTML/CSS/JS site — no framework, no build step.
Five menu sections: Coffee, Signature Drinks, Tea, Pastries, Light Fare.
Each section contains `.menu-item` cards inside a `.menu-grid`.

---

## Step 1 — Add `data-category` attributes to menu items (~5 min)

Tag each `.menu-item` div with `data-category="coffee"` (or `signature`, `tea`, `pastries`, `food`).

**Test:** Open DevTools → inspect an item → confirm the attribute is there.

---

## Step 2 — Add filter button bar (HTML + CSS only) (~10 min)

Insert a row of filter buttons above the menu sections:
**All / Coffee / Signature / Tea / Pastries / Light Fare**

Style them to match the site's existing palette (cream/caramel/espresso). No JS yet.

**Test:** Open the page — buttons appear, look right, click does nothing yet.

---

## Step 3 — Wire up the filter logic (JS) (~10 min)

Add a `<script>` block that listens for button clicks, toggles an `.active` class on the
button, then shows/hides `.menu-item` elements by matching `data-category`. Also hide
empty `.menu-section` headings when all their children are filtered out.

**Test:** Click each filter button — only matching items appear, section headings hide/show
correctly. "All" restores everything.

---

## Step 4 — Add modal HTML + CSS (no trigger yet) (~10 min)

Append a hidden `<div class="modal-overlay">` containing a dialog with a close button,
image placeholder, item name, description, and price. Style it (centered, backdrop blur,
slide-in animation).

**Test:** Temporarily add `class="modal-overlay active"` in HTML → the modal looks correct
→ remove the class.

---

## Step 5 — Open modal on item click (JS) (~10 min)

Add a click handler to each `.menu-item` that reads its `h4`, `p`, and price text, injects
them into the modal, then adds the `.active` class to show it.

**Test:** Click any menu item → modal opens with that item's correct name, description,
and price.

---

## Step 6 — Wire up modal close behaviors (JS) (~5 min)

Three ways to close: clicking the **×** button, clicking the backdrop outside the dialog,
pressing **Escape**.

**Test:** Try all three close methods from different items.
