# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131201022030) do

  create_table "polls", force: true do |t|
    t.integer  "teamAWins"
    t.integer  "teamALosses"
    t.integer  "teamAPointsFor"
    t.integer  "teamAPointsAgainst"
    t.string   "teamALocation"
    t.integer  "teamBWins"
    t.integer  "teamBLosses"
    t.integer  "teamBPointsFor"
    t.integer  "teamBPointsAgainst"
    t.string   "teamBLocation"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "teamAName"
    t.string   "teamBName",          limit: nil
  end

end
