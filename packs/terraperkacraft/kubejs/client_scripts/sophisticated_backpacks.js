//requires: tfc
//requires: sophisticatedbackpacks

RecipeViewerEvents.removeEntriesCompletely('item', event => {
  event.remove('sophisticatedcore:xp_bucket')
})

RecipeViewerEvents.removeEntriesCompletely('fluid', event => {
  event.remove('sophisticatedcore:xp_still')
})
