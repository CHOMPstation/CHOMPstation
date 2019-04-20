var/list/all_trainee_defense = list(/datum/technomancer/spell/reflect,/datum/technomancer/spell/shield)
var/list/all_trainee_offense = list(/datum/technomancer/spell/flame_tongue,/datum/technomancer/spell/warp_strike,/datum/technomancer/spell/beam,/datum/technomancer/spell/force_missile,/datum/technomancer/spell/lesser_chain_lightning)
var/list/all_trainee_utility = list(/datum/technomancer/spell/abjuration,/datum/technomancer/spell/audible_deception,/datum/technomancer/spell/chroma,/datum/technomancer/spell/condensation,/datum/technomancer/spell/energy_siphon,/datum/technomancer/spell/illusion,/datum/technomancer/spell/mark,/datum/technomancer/spell/recall,/datum/technomancer/spell/track,/datum/technomancer/spell/darkness,/datum/technomancer/spell/summon_ward)
var/list/all_trainee_support = list(/datum/technomancer/spell/dispel,/datum/technomancer/spell/oxygenate,/datum/technomancer/spell/corona,/datum/technomancer/spell/haste,/datum/technomancer/spell/mend_life,/datum/technomancer/spell/mend_synthetic,/datum/technomancer/spell/purify)

/obj/item/weapon/technomancer_catalog/trainee
    name = "trainee's catalog"
    budget = 400
    max_budget = 400

/obj/item/weapon/technomancer_catalog/trainee/set_up()
    if(!spell_instances.len)
        for(var/D in all_trainee_defense)
            spell_instances += new D()
        for(var/O in all_trainee_offense)
            spell_instances += new O()
        for(var/U in all_trainee_utility)
            spell_instances += new U()
        for(var/S in all_trainee_support)
            spell_instances += new S()
