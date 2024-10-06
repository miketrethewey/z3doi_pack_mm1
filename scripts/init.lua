-- Version
ScriptHost:LoadScript("scripts/ver.lua")

-- Settings
ScriptHost:LoadScript("scripts/settings/settings.lua")

-- Helpers
ScriptHost:LoadScript("scripts/items/helpers.lua")

-- Logic
ScriptHost:LoadScript("scripts/logic/logic.lua")

local variant = Tracker.ActiveVariantUID
if variant == "" then
  variant = "items_only"
end

local emeralds = variant == "emeralds"

-- Items
print("Loading Items")
dir = "items"
items = {
  "armor",
  "bottles",
  "canes",
  "expansion",
  "fetch",
  "items",
  "kinstones",
  "pendants",
  "resources",
  "rings",
  "rods",
  "weapons"
}
for _, itemCat in ipairs(items) do
  Tracker:AddItems(dir .. "/" .. itemCat .. ".json")
end
if emeralds then
  itemCat = "emeralds"
  Tracker:AddItems(dir .. "/" .. itemCat .. ".json")
else
  itemCat = "gems"
  Tracker:AddItems(dir .. "/" .. itemCat .. ".json")
end
-- Tracker:AddLayouts("layouts/settings.json")
print("")

-- Grids
print("Loading Grids")
dir = "layouts/grids"
grids = {
  "items",
  "grids"
}
for _, gridCat in ipairs(grids) do
  Tracker:AddLayouts(dir .. "/" .. gridCat .. ".json")
end
print("")


if string.find(variant, "map") or true then
  print("Map Variant; load map stuff")
  -- Synthesis Map
  Tracker:AddMaps("maps/synthesis.json")

  -- Map Layouts
  Tracker:AddLayouts("layouts/maps/synthesis.json")

  -- Locations
  locations = {
    "synthesis"
  }
  for _, locCat in ipairs(locations) do
    Tracker:AddLocations("locations/" .. locCat .. ".json")
  end
  print("")
else
  -- Legacy
  print("Satisfy Legacy Loads")
  -- Tracker:AddMaps("maps/maps.json")
  -- Tracker:AddLocations("locations/world.json")
  print("")
end

-- Variant Overrides
if variant ~= "items_only" and variant ~= "emeralds" then
  print("Loading Variant")
  -- Layout Overrides
--   Tracker:AddLayouts("variants/" .. variant .. "/layouts/tracker-capture.json")     -- Capture Grid
--   Tracker:AddLayouts("variants/" .. variant .. "/layouts/tracker-horizontal.json")  -- Horizontal Tracker
--   Tracker:AddLayouts("variants/" .. variant .. "/layouts/tracker-vertical.json")    -- Vertical Tracker
--   Tracker:AddLayouts("variants/" .. variant .. "/layouts/tracker.json")             -- Main Tracker
--   Tracker:AddLayouts("variants/" .. variant .. "/layouts/broadcast.json")           -- Broadcast View
  print("")
else
  print("Not a Variant; load default stuff")
  -- Layout Defaults
--   Tracker:AddLayouts("layouts/tracker-capture.json")    -- Capture Grid
  Tracker:AddLayouts("layouts/tracker-horizontal.json") -- Horizontal Tracker
  Tracker:AddLayouts("layouts/tracker-vertical.json")   -- Vertical Tracker
  Tracker:AddLayouts("layouts/tracker.json")            -- Main Tracker
  Tracker:AddLayouts("layouts/broadcast.json")          -- Broadcast View
  print("")
end
