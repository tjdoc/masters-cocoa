//
//  main.swift
//  20201125
//
//  Created by Tae-Jin Oh on 2020/11/24.
//

import Foundation

// problem 1

print(files(at: "/System/Library/Desktop Pictures", sort: true))
//[".orderedPictures.plist", ".thumbnails", "Big Sur Aerial.heic", "Big Sur Coastline.heic", "Big Sur Day.heic", "Big Sur Graphic Day.heic", "Big Sur Graphic Night.heic", "Big Sur Graphic.heic", "Big Sur Horizon.heic", "Big Sur Mountains.heic", "Big Sur Night Grasses.heic", "Big Sur Night Succulents.heic", "Big Sur Night.heic", "Big Sur Road.heic", "Big Sur Shore Rocks.heic", "Big Sur Waters Edge.heic", "Big Sur.heic", "Catalina Clouds.heic", "Catalina Coast.heic", "Catalina Day.heic", "Catalina Evening.heic", "Catalina Night.heic", "Catalina Rock.heic", "Catalina Shoreline.heic", "Catalina Silhouette.heic", "Catalina Sunset.heic", "Catalina.heic", "Dome Day.heic", "Dome Night.heic", "Dome.heic", "Iridescence Day.heic", "Iridescence Night.heic", "Iridescence.heic", "Light Stream Blue.heic", "Light Stream Red.heic", "Peak Day.heic", "Peak Night.heic", "Peak.heic", "Reflection 1.jpg", "Reflection 2.jpg", "Reflection 3.jpg", "Reflection 4.jpg", "Solar Gradients.heic", "Solid Colors", "The Beach Day.heic", "The Beach Night.heic", "The Beach.heic", "The Cliffs Day.heic", "The Cliffs Night.heic", "The Cliffs.heic", "The Desert Day.heic", "The Desert Night.heic", "The Desert.heic", "The Lake Day.heic", "The Lake Night.heic", "The Lake.heic", "Tree Day.heic", "Tree Night.heic", "Tree.heic", "Valley Day.heic", "Valley Night.heic", "Valley.heic"]

print(isExist(filename: ["Big Sur Road.heic", "Valley Night.heic", "whatever.heic"], at: "/System/Library/Desktop Pictures"))
//[true, true, false]
print(searchExtension(extension: "pdf", at: "/Users/oht/Documents/pdfBooks/bike", sort: true))
//["2006 JOB - Umberger et al.pdf", "power training_20121014_donnybike.pdf", "Shannon_Sovndal - Cycling_anatomy.pdf", "Bryton 310 Users Manual.pdf", "Stages Power Meter User Guide 000-2530  Rev. B .pdf", "2018 Giant TCR Advanced SL1 spec.pdf", "체육지도자 훈련 지도서 - 사이클.pdf", "Xplova NOZA_QSG_EN_20181130.pdf", "Bike_map_seoul.pdf", "Fly12CE_User_Manual.pdf", "Brian_Fiske - Bicycling_Essential_Road_Bike_Mainte.pdf", "John_Hughes - Distance_cycling.pdf", "TrainingPeaks-How-to-Start-Training-with-Power-eBook.pdf", "XLite 100 manual.pdf", "Ortlieb saddlebag.pdf"]


// problem 2

//let mycsv = CsvProcessor(csvFilePath: "/Users/oht/Desktop/test.csv")
let mycsv = CsvProcessor(csvFileName: "test.csv") // reads from user Desktop folder
mycsv.add(name: "Ted", email: "ted_fake@email.com", language: "swift", grade: 51)
mycsv.add(name: "Paul", email: "paul_fake@email.com", language: "python", grade: 70)
mycsv.add(name: "Villain", email: "the_bad_guy@email.com", language: "fortran", grade: 30)
print()
print(mycsv.findBy(name: "Ted"))
print(mycsv.removeBy(email: "the_bad_guy@email.com"))
print(mycsv.removeBy(email: "non_existant@email.com"))
mycsv.show()
print(mycsv.writeToPath(filePath: "/Users/oht/Desktop/test3.csv"))
print(mycsv.writeToDesktop(fileName: "test4.csv"))


// problem 3

// ran on a macbook pro 13 inch 2018, processor 2.3 GHz, Quad-Core Intel Core i5, Mem 16GB
for ii in 1...20 {wordCountAsync(concurrentNum: ii)}

// result --------------

//개인: 58
//경제: 712
//국제: 41
//노동: 619
//대중: 47
//부자: 72
//사람: 424
//사상: 242
//사회: 617
//새로운: 66
//생활: 83
//소비: 164
//시장: 220
//욕망: 17
//이론: 263
//인물: 44
//자원: 25
//자유: 307
//재산: 102
//학자: 287
//Elapsed time with concurrent  1 threads: 0.23343289700278547
//Elapsed time with concurrent  2 threads: 0.11810306600818876
//Elapsed time with concurrent  3 threads: 0.08040908099792432
//Elapsed time with concurrent  4 threads: 0.07086902200535405
//Elapsed time with concurrent  5 threads: 0.06577696499880403
//Elapsed time with concurrent  6 threads: 0.06541064599878155
//Elapsed time with concurrent  7 threads: 0.0641817430005176
//Elapsed time with concurrent  8 threads: 0.06421303999377415
//Elapsed time with concurrent  9 threads: 0.06153406700468622
//Elapsed time with concurrent 10 threads: 0.06380383399664424
//Elapsed time with concurrent 11 threads: 0.06423706500208937
//Elapsed time with concurrent 12 threads: 0.06047685199882835
//Elapsed time with concurrent 13 threads: 0.06166824800311588
//Elapsed time with concurrent 14 threads: 0.06282241699227598
//Elapsed time with concurrent 15 threads: 0.06540574799873866
//Elapsed time with concurrent 16 threads: 0.06384490799973719
//Elapsed time with concurrent 17 threads: 0.06463742200867273
//Elapsed time with concurrent 18 threads: 0.062415757987764664
//Elapsed time with concurrent 19 threads: 0.062027683001360856
//Elapsed time with concurrent 20 threads: 0.0638040800113231
