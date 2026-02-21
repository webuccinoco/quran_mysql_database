SET NAMES utf8mb4;
USE QuranDB;

CREATE TABLE IF NOT EXISTS daily_verses (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  chapter_id INT UNSIGNED NOT NULL,
  verse_number INT UNSIGNED NOT NULL,
  arabic_text_tashkeel TEXT NOT NULL,
  arabic_text_plain TEXT NOT NULL,
  default_english_translation TEXT NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uniq_daily_verse (chapter_id, verse_number),
  KEY idx_daily_verses_chapter (chapter_id),
  CONSTRAINT fk_daily_verses_chapter
    FOREIGN KEY (chapter_id) REFERENCES chapters (id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;
