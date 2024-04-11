package com.onurvar.massiverpg.domain.model

enum class CharacterRace(val title: String) {
    Elf("Elf"),
    Human("Human"),
    Dwarf("Dwarf"),
    Orc("Orc");

    companion object {
        val default = Elf
        val list = values().toList()
    }
}