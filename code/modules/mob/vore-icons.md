# How to VORE icons

#### Vore Icon STATE names are GENERATED based on 2 things.
* 1. The state we are using Example if we use living our vore icon var is SA_ICON_LIVING 
* 2. The amount of prey in a boi.

### What effects does this have?

Well as an example we can use the panther who actually DOES have multive vore,

`vore_capacity = 2`

And has not just 1 vore icon type but 2

`vore_icons = SA_ICON_LIVING | SA_ICON_REST`

Our Icon_State is `"panther"`
And our living state is the `"panther"`

Now since we have a capacity of 2 not 1 the game will assign 4 vore slots for icon states.
These are generated out of our prior mentioned states

The game assigns `"panther-1"` for 1 victim in gut LIVING and `"panther-2"` for 2 victim in gut LIVNING
Rest sprite follows a similiar idea simply being as follows
the base state `"panther-rest"` and then single vore `"panther-rest-1"` double vore `"panther-rest-2"`

The REST state doesnt seem to be set within the panther.dm so it stands to reason that the game is looking for the state itself
Meaning that if my asusmption here is true you can simply add `-rest` to you original state name and the game should recognize it as rest state.

So if we had our original state `"synx"` our 1 person vore icon state would be `"synx-1"` and so forth.
