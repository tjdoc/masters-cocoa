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
// Components       NSRegularExpression
// *correct*        *incorrect*          *correct*
// 개인: 58          58                   58
// 경제: 739         712                  739
// 국제: 41          41                   41
// 노동: 624         619                  624
// 대중: 47          47                   47
// 부자: 72          72                   72
// 사람: 425         424                  425
// 사상: 249         242                  249
// 사회: 619         617                  619
// 새로운: 69         66                  69
// 생활: 84          83                   84
// 소비: 167         164                  167
// 시장: 220         220                  220
// 욕망: 17          17                   17
// 이론: 264         263                  264
// 인물: 44          44                   44
// 자원: 25          25                   25
// 자유: 307         307                  307
// 재산: 102         102                  102
// 학자: 291         287                  291
//
//                                          components            buggy NSRegularExpression  correct NSRegularExpression
//                                          baseline              faster                     super-fast
// Elapsed time with concurrent  1 threads: 0.34997959100292064   0.21968312599346973        0.00872062801499851
// Elapsed time with concurrent  2 threads: 0.17711547398357652   0.11185295498580672        0.006370874005369842
// Elapsed time with concurrent  3 threads: 0.12775109201902524   0.07887546400888823        0.005514301010407507
// Elapsed time with concurrent  4 threads: 0.0997292689862661    0.05887587001780048        0.004939263017149642
// Elapsed time with concurrent  5 threads: 0.10420420198352076   0.0604630489833653         0.005060194991528988
// Elapsed time with concurrent  6 threads: 0.10204536799574271   0.061966601002495736       0.0048288780089933425
// Elapsed time with concurrent  7 threads: 0.0936314919963479    0.05935210999450646        0.004782328003784642
// Elapsed time with concurrent  8 threads: 0.09550223799305968   0.05900534300599247        0.0049814739904832095
// Elapsed time with concurrent  9 threads: 0.0920162409893237    0.06242950598243624        0.004813906998606399
// Elapsed time with concurrent 10 threads: 0.09516730500035919   0.05913641001097858        0.004379730991786346
// Elapsed time with concurrent 11 threads: 0.09545908798463643   0.06506419600918889        0.004583247005939484
// Elapsed time with concurrent 12 threads: 0.09495068198884837   0.05898041700129397        0.0046974970027804375
// Elapsed time with concurrent 13 threads: 0.09897100599482656   0.062290795001899824       0.004839450994040817
// Elapsed time with concurrent 14 threads: 0.09311492400593124   0.061616088001756          0.004791980987647548
// Elapsed time with concurrent 15 threads: 0.09689176300889812   0.058945262018823996       0.004703579004853964
// Elapsed time with concurrent 16 threads: 0.10089829101343639   0.06219605801743455        0.004680466983700171
// Elapsed time with concurrent 17 threads: 0.09422703497693874   0.06163451200700365        0.004686308995587751
// Elapsed time with concurrent 18 threads: 0.09901754197198898   0.06334725199849345        0.004636046011000872
// Elapsed time with concurrent 19 threads: 0.09524539901758544   0.06143143301596865        0.0045321930083446205
// Elapsed time with concurrent 20 threads: 0.09926398599054664   0.06250075798016042        0.005712613987270743
