# Quran Database (MySQL)

This repository provides a ready-to-import MySQL database for the Holy Quran, including Arabic text both fully vocalized (with tashkeel/diacritics) and unvocalized (without vowel marks).

## Project Overview

The aim is to help teams integrate the Holy Quran text into their infrastructure without spending time building the database layer. The project is MIT licensed, so it can be used in both commercial and non-commercial applications.

## Recognition

Resource files used to generate this database come from the `quran-layers` project by [BigProf](https://github.com/bigprof-software/quran-layers).  
Repository: [https://github.com/bigprof-software/quran-layers](https://github.com/bigprof-software/quran-layers)

## What’s Included (Current)

The database contains two core tables:

### `chapters` Table
Stores the Surah metadata:
- `id`: Surah number (1–114).
- `arabic_name`: Arabic Surah name (Unicode).
- `english_transliteration`: English transliteration of the Surah name.
- `english_translation`: English meaning/translation of the Surah name.

> **Note:** If imported successfully, this table should contain 114 records.

### `verses` Table
Stores each Ayah linked to its Surah:
- `id`: Auto-increment verse row ID.
- `chapter_id`: Surah number (FK → `chapters.id`).
- `verse_number`: Ayah number within the Surah (1..n).
- `arabic_text_tashkeel`: Arabic Ayah text with Tashkeel (diacritics).
- `arabic_text_plain`: Arabic Ayah text without Tashkeel.

Arabic is stored using `utf8mb4` to preserve full diacritics.

> **Note:** If imported successfully, this table should contain 6236 records.


## How to Use

1. Create a database named **`QuranDB`** (or let the import create it).
2. In your MySQL client (phpMyAdmin / MySQL Workbench / CLI), use **Import**.
3. Import this file only:
   - `quran_database/quranDB.sql`

That file creates the database, tables, and inserts all data.

## Coming Next

- **Translations** (separate tables per source)
- **Reflections** and additional metadata
- **Topics & Tags** linked to related verses

