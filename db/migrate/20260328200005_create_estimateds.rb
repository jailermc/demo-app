class CreateEstimateds < ActiveRecord::Migration[6.1]
  def change
create_table "estimateds", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.string "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "alabor1"
    t.string "adescription1"
    t.integer "adays1"
    t.integer "aemp1"
    t.decimal "apricing1", precision: 8, scale: 2
    t.decimal "atotal1", precision: 8, scale: 2
    t.integer "alabor2"
    t.string "adescription2"
    t.integer "adays2"
    t.integer "aemp2"
    t.decimal "apricing2", precision: 8, scale: 2
    t.decimal "atotal2", precision: 8, scale: 2
    t.integer "alabor3"
    t.string "adescriptio3"
    t.integer "adays3"
    t.integer "aemp3"
    t.decimal "apricing3", precision: 8, scale: 2
    t.decimal "atotal3", precision: 8, scale: 2
    t.integer "alabor4"
    t.string "adescription4"
    t.integer "adays4"
    t.integer "aemp4"
    t.decimal "apricing4", precision: 8, scale: 2
    t.decimal "atotal4", precision: 8, scale: 2
    t.integer "alabor5"
    t.string "adescription5"
    t.integer "adays5"
    t.integer "aemp5"
    t.decimal "apricing5", precision: 8, scale: 2
    t.decimal "atotal5", precision: 8, scale: 2
    t.integer "alabor6"
    t.string "adescription6"
    t.integer "adays6"
    t.integer "aemp6"
    t.decimal "apricing6", precision: 8, scale: 2
    t.decimal "atotal6", precision: 8, scale: 2
    t.integer "alabor7"
    t.string "adescription7"
    t.integer "adays7"
    t.integer "aemp7"
    t.decimal "apricing7", precision: 8, scale: 2
    t.decimal "atotal7", precision: 8, scale: 2
    t.integer "alabor8"
    t.string "adescription8"
    t.integer "adays8"
    t.integer "aemp8"
    t.decimal "apricing8", precision: 8, scale: 2
    t.decimal "atotal8", precision: 8, scale: 2
    t.integer "alabor9"
    t.string "adescription9"
    t.integer "adays9"
    t.integer "aemp9"
    t.decimal "apricing9", precision: 8, scale: 2
    t.decimal "atotal9", precision: 8, scale: 2
    t.string "eexcavator1"
    t.string "edescription1"
    t.integer "eqty1"
    t.integer "edaywk1"
    t.decimal "epricing1", precision: 8, scale: 2
    t.decimal "etotal1", precision: 10, scale: 2
    t.string "eexcavator2"
    t.string "edescription2"
    t.integer "eqty2"
    t.integer "edaywk2"
    t.decimal "epricing2", precision: 8, scale: 2
    t.decimal "etotal2", precision: 10, scale: 2
    t.string "scisso3"
    t.string "edescription3"
    t.integer "eqty3"
    t.integer "edaywk3"
    t.decimal "epricing3", precision: 8, scale: 2
    t.decimal "etotal3", precision: 10, scale: 2
    t.string "loader4"
    t.string "edescription4"
    t.integer "eqty4"
    t.integer "edaywk4"
    t.decimal "epricing4", precision: 8, scale: 2
    t.decimal "etotal4", precision: 10, scale: 2
    t.string "etrunck5"
    t.string "edescription5"
    t.integer "eqty5"
    t.integer "edaywk5"
    t.decimal "epricing5", precision: 8, scale: 2
    t.decimal "etotal5", precision: 10, scale: 2
    t.string "ebobcat6"
    t.string "edescription6"
    t.integer "eqty6"
    t.integer "edaywk6"
    t.decimal "epricing6", precision: 8, scale: 2
    t.decimal "etotal6", precision: 10, scale: 2
    t.decimal "etotal", precision: 10, scale: 2
    t.string "edefault7"
    t.string "edescription7"
    t.integer "eqty7"
    t.integer "edaywk7"
    t.decimal "epricing7", precision: 8, scale: 2
    t.decimal "etotal7", precision: 10, scale: 2
    t.string "edefault8"
    t.string "edescription8"
    t.integer "eqty8"
    t.integer "edaywk8"
    t.decimal "epricing8", precision: 8, scale: 2
    t.decimal "etotal8", precision: 10, scale: 2
    t.string "ttrash1"
    t.string "tdescription1"
    t.integer "tqtyyds1"
    t.integer "tdays1"
    t.decimal "tpricing1", precision: 8, scale: 2
    t.string "tconcrete2"
    t.string "tdescription2"
    t.integer "tqtyyds2"
    t.integer "tdays2"
    t.decimal "tpricing2", precision: 8, scale: 2
    t.string "tasphalt3"
    t.string "tdescription3"
    t.integer "tqtyyds3"
    t.integer "tdays3"
    t.decimal "tpricing3", precision: 8, scale: 2
    t.decimal "ttotal", precision: 10, scale: 2
    t.string "pdemo1"
    t.string "pdescription1"
    t.integer "pqty1"
    t.integer "pdays1"
    t.decimal "ppricing1", precision: 8, scale: 2
    t.string "pplumbing2"
    t.string "pdescription2"
    t.integer "pqty2"
    t.integer "pdays2"
    t.decimal "ppricing2", precision: 8, scale: 2
    t.string "pelectical3"
    t.string "pdescription3"
    t.integer "pqty3"
    t.integer "pdays3"
    t.decimal "ppricing3", precision: 8, scale: 2
    t.string "pderm4"
    t.string "pdescription4"
    t.integer "pqty4"
    t.integer "pdays4"
    t.decimal "ppricing4", precision: 8, scale: 2
    t.string "ptree5"
    t.string "pdescription5"
    t.integer "pqty5"
    t.integer "pdays5"
    t.decimal "ppricing5", precision: 8, scale: 2
    t.string "pmechanical6"
    t.string "pdescription6"
    t.integer "pqty6"
    t.integer "pdays6"
    t.decimal "ppricing6", precision: 8, scale: 2
    t.string "ptotal"
    t.string "mmiscellaneous1"
    t.string "mdescription1"
    t.integer "mqtysfft1"
    t.integer "mdays1"
    t.decimal "mpricing1", precision: 8, scale: 2
    t.string "mdefault2"
    t.string "mdescription2"
    t.integer "mqtysfft2"
    t.integer "mdays2"
    t.decimal "mpricing2", precision: 8, scale: 2
    t.string "mdefault3"
    t.string "mdescription3"
    t.integer "mqtysfft3"
    t.integer "mdays3"
    t.decimal "mpricing3", precision: 8, scale: 2
    t.decimal "mtotal", precision: 10, scale: 2
    t.decimal "subtotal", precision: 10, scale: 2
    t.decimal "profit", precision: 10, scale: 2
    t.decimal "total", precision: 10, scale: 2
    t.decimal "sf", precision: 10, scale: 2
    t.decimal "persf", precision: 10, scale: 2
    t.integer "totaldays"
    t.decimal "profitporcen", precision: 10, scale: 2
    t.integer "salvage"
    t.decimal "atotal", precision: 10, scale: 2
    t.string "sdefault1"
    t.string "sdescription1"
    t.integer "sqtysflf1"
    t.integer "sdays1"
    t.decimal "spricing", precision: 8, scale: 2
    t.decimal "stotal1", precision: 10, scale: 2
    t.decimal "stotal", precision: 10, scale: 2
    t.decimal "ttotal1", precision: 10, scale: 2
    t.decimal "ttotal2", precision: 10, scale: 2
    t.decimal "ttotal3", precision: 10, scale: 2
    t.decimal "ptotal1", precision: 10, scale: 2
    t.decimal "ptotal2", precision: 10, scale: 2
    t.decimal "ptotal3", precision: 10, scale: 2
    t.decimal "ptotal4", precision: 10, scale: 2
    t.decimal "ptotal5", precision: 10, scale: 2
    t.decimal "ptotal6", precision: 10, scale: 2
    t.decimal "mtotal1", precision: 10, scale: 2
    t.decimal "mtotal2", precision: 10, scale: 2
    t.decimal "mtotal3", precision: 10, scale: 2
    t.string "mfill1"
    t.string "mdefault4"
    t.string "mdescription4"
    t.integer "mqtysfft4"
    t.integer "mdays4"
    t.decimal "mpricing4", precision: 8, scale: 2
    t.decimal "mtotal4", precision: 10, scale: 2
    t.string "mdefault5"
    t.string "mdescription5"
    t.integer "mqtysfft5"
    t.integer "mdays5"
    t.decimal "mpricing5", precision: 8, scale: 2
    t.decimal "mtotal5", precision: 10, scale: 2
    t.string "ttree1"
    t.string "tdescription4"
    t.integer "tqtyyds4"
    t.integer "tdays4"
    t.decimal "tpricing4", precision: 8, scale: 2
    t.decimal "ttotal4", precision: 10, scale: 2
    t.string "mdefault6"
    t.string "mdescription6"
    t.integer "mqtysfft6"
    t.integer "mdays6"
    t.decimal "mpricing6", precision: 8, scale: 2
    t.decimal "mtotal6", precision: 10, scale: 2
    t.string "mdefault7"
    t.string "mdescription7"
    t.integer "mqtysfft7"
    t.integer "mdays7"
    t.decimal "mpricing7", precision: 8, scale: 2
    t.decimal "mtotal7", precision: 10, scale: 2
    t.string "mdefault8"
    t.string "mdescription8"
    t.integer "mqtysfft8"
    t.integer "mdays8"
    t.decimal "mpricing8", precision: 8, scale: 2
    t.decimal "mtotal8", precision: 10, scale: 2
    t.string "spricing1"
    t.decimal "pptotal", precision: 10, scale: 2
    t.date "date1"
    t.string "address"
    t.string "saw1"
    t.integer "cost_sheet_id"
    t.string "mhydro9"
    t.string "mdescription9"
    t.integer "mqtysfft9"
    t.integer "mdays9"
    t.decimal "mpricing9"
    t.decimal "mtotal9", precision: 10, scale: 2
    t.string "mfence10"
    t.string "mdescription10"
    t.integer "mqtysfft10"
    t.integer "mdays10"
    t.decimal "mpricing10"
    t.decimal "mtotal10", precision: 10, scale: 2
    t.string "mfreon11"
    t.string "mdescription11"
    t.integer "mqtysfft11"
    t.integer "mdays11"
    t.decimal "mpricing11"
    t.decimal "mtotal11", precision: 10, scale: 2
    t.decimal "invoice"
    t.string "saw2"
    t.string "sdescription2"
    t.integer "sqtysflf2"
    t.integer "sdays2"
    t.decimal "spricing2"
    t.decimal "stotal2", precision: 10, scale: 2
    t.string "saw3"
    t.string "sdescription3"
    t.integer "sqtysflf3"
    t.integer "sdays3"
    t.decimal "spricing3"
    t.decimal "stotal3", precision: 10, scale: 2
    t.integer "ahours1"
    t.integer "ahours2"
    t.integer "ahours3"
    t.integer "ahours4"
    t.integer "ahours5"
    t.integer "ahours6"
    t.integer "ahours7"
    t.integer "ahours8"
    t.integer "ahours9"
    t.decimal "ttotalx", precision: 10, scale: 2
    t.integer "over1"
    t.integer "over2"
    t.integer "over3"
    t.integer "over4"
    t.integer "over5"
    t.integer "over6"
    t.integer "over7"
    t.integer "over8"
    t.integer "over9"
    t.string "mdescription12"
    t.integer "mqtysfft12"
    t.decimal "mpricing12"
    t.decimal "mtotal12", precision: 10, scale: 2
    t.string "mdescription13"
    t.integer "mqtysfft13"
    t.decimal "mpricing13"
    t.decimal "mtotal13", precision: 10, scale: 2
    t.string "mdescription14"
    t.integer "mqtysfft14"
    t.decimal "mpricing14"
    t.decimal "mtotal14", precision: 10, scale: 2
    t.string "mdescription15"
    t.integer "mqtysfft15"
    t.decimal "mpricing15"
    t.decimal "mtotal15", precision: 10, scale: 2
    t.decimal "totalsalvage"
    t.string "user"
    t.integer "alabor10"
    t.string "adescription10"
    t.integer "aemp10"
    t.integer "adays10"
    t.integer "ahours10"
    t.decimal "apricing10"
    t.decimal "atotal10"
    t.integer "alabor11"
    t.string "adescription11"
    t.integer "aemp11"
    t.integer "adays11"
    t.integer "ahours11"
    t.decimal "apricing11"
    t.decimal "atotal11"
    t.integer "alabor12"
    t.string "adescription12"
    t.integer "aemp12"
    t.integer "adays12"
    t.integer "ahours12"
    t.decimal "apricing12"
    t.decimal "atotal12"
    t.string "edefault9"
    t.string "edescription9"
    t.integer "eqty9"
    t.integer "edaywk9"
    t.decimal "epricing9"
    t.decimal "etotal9", precision: 10, scale: 2
    t.string "edefault10"
    t.string "edescription10"
    t.integer "eqty10"
    t.integer "edaywk10"
    t.decimal "epricing10"
    t.decimal "etotal10", precision: 10, scale: 2
    t.string "edefault11"
    t.string "edescription11"
    t.integer "eqty11"
    t.integer "edaywk11"
    t.decimal "epricing11"
    t.decimal "etotal11", precision: 10, scale: 2
    t.string "edefault12"
    t.string "edescription12"
    t.integer "eqty12"
    t.integer "edaywk12"
    t.decimal "epricing12"
    t.decimal "etotal12", precision: 10, scale: 2
    t.integer "over10"
    t.integer "over11"
    t.integer "over12"
    t.string "tdescription5"
    t.integer "tqtysfft5"
    t.decimal "tpricing5"
    t.decimal "ttotal5", precision: 10, scale: 2
    t.string "tdescription6"
    t.integer "tqtyyds6"
    t.decimal "tpricing6"
    t.decimal "ttotal6", precision: 10, scale: 2
    t.string "subdefault1"
    t.string "subdescription1"
    t.integer "subqtysfft1"
    t.decimal "subpricing1"
    t.decimal "subtotal1"
    t.string "subdefault2"
    t.string "subdescription2"
    t.integer "subqtysfft2"
    t.decimal "subpricing2"
    t.decimal "subtotal2"
    t.decimal "subtotaltotal"
    t.string "pdescription7"
    t.integer "pqty7"
    t.decimal "ppricing7"
    t.decimal "ptotal7", precision: 10, scale: 2
    t.string "mdescription16"
    t.integer "mqtysfft16"
    t.decimal "mpricing16"
    t.decimal "mtotal16", precision: 10, scale: 2
    t.decimal "mpricing21"
    t.string "mdescription17"
    t.integer "mqtysfft17"
    t.decimal "mpricing17"
    t.decimal "mtotal17", precision: 10, scale: 2
    t.string "subdefault3"
    t.string "subdescription3"
    t.integer "subqtysfft3"
    t.decimal "subpricing3"
    t.integer "subporce3"
    t.decimal "subtotal3"
    t.decimal "subporce2"
    t.integer "subporce1"
    t.string "mdescription18"
    t.integer "mqtysfft18"
    t.decimal "mpricing18"
    t.decimal "mtotal18", precision: 10, scale: 2
    t.string "pdescription8"
    t.integer "pqty8"
    t.decimal "ppricing8"
    t.decimal "ptotal8"
    t.string "fdescription1"
    t.integer "fqtysflf1"
    t.integer "fdays1"
    t.decimal "fpricing1"
    t.decimal "ftotal1"
    t.decimal "ftotal"
    t.string "fuel1"
    t.string "ec_description3"
    t.integer "ec_qty3"
    t.decimal "ec_pricing3"
    t.decimal "ec_total3"
    t.string "ec_description4"
    t.integer "ec_qty4"
    t.decimal "ec_pricing4"
    t.decimal "ec_total4"
    t.string "ec_description5"
    t.integer "ec_qty5"
    t.decimal "ec_pricing5"
    t.decimal "ec_total5"
    t.decimal "ec_total"
    t.decimal "tf_total"
    t.string "mov_pdescription2"
    t.integer "mov_pqty2"
    t.decimal "mov_pricing2"
    t.decimal "mov_total2"
    t.decimal "per_total"
    t.string "test10"
    t.string "test"
    t.string "mdescription31"
    t.integer "mqtysfft31"
    t.decimal "mpricing31"
    t.decimal "mtotal31"
    t.string "mdescription32"
    t.integer "mqtysfft32"
    t.decimal "mpricing32"
    t.decimal "mtotal32"
    t.decimal "eresult1"
    t.decimal "eresult2"
    t.decimal "eresult3"
    t.decimal "eresult4"
    t.decimal "eresult5"
    t.decimal "eresult6"
    t.decimal "eresult7"
    t.decimal "eresult8"
    t.decimal "eresult9"
    t.decimal "eresult10"
    t.decimal "eresult11"
    t.decimal "eresult12"
    t.decimal "totalfuel"
    t.integer "mov_pqty3"
    t.decimal "mov_pricing3"
    t.decimal "mov_total3"
    t.string "mov_pdescription3"
  end
  end
end
