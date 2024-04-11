package com.onurvar.massiverpg.domain.model

enum class CharacterClass(val rawValue: String) {
    Fighter("fighter"),
    Cleric("cleric"),
    Rogue("rogue"),
    Wizard("wizard"),
    Bard("bard");

    val title: String
        get() = rawValue.capitalize()

    companion object {
        val default = Fighter
        val list = values().toList()

        fun fromRawValue(rawValue: String): CharacterClass {
            return values().first { it.rawValue == rawValue }
        }
    }

    override fun toString(): String {
        return rawValue
    }
}