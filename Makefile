CXX = g++-8

liblarge.so: add0.o add1.o add2.o add3.o add4.o add5.o add6.o add7.o add8.o add9.o add10.o add11.o add12.o add13.o add14.o add15.o add16.o add17.o add18.o add19.o add20.o add21.o add22.o add23.o add24.o add25.o add26.o add27.o add28.o add29.o add30.o add31.o add32.o add33.o add34.o add35.o add36.o add37.o add38.o add39.o add40.o add41.o add42.o add43.o add44.o add45.o add46.o add47.o add48.o add49.o add50.o add51.o add52.o add53.o add54.o add55.o add56.o add57.o add58.o add59.o add60.o add61.o add62.o add63.o add64.o add65.o add66.o add67.o add68.o add69.o add70.o add71.o add72.o add73.o add74.o add75.o add76.o add77.o add78.o add79.o add80.o add81.o add82.o add83.o add84.o add85.o add86.o add87.o add88.o add89.o add90.o add91.o add92.o add93.o add94.o add95.o add96.o add97.o add98.o add99.o add100.o add101.o add102.o add103.o add104.o add105.o add106.o add107.o add108.o add109.o add110.o add111.o add112.o add113.o add114.o add115.o add116.o add117.o add118.o add119.o add120.o add121.o add122.o add123.o add124.o add125.o add126.o add127.o add128.o add129.o add130.o add131.o add132.o add133.o add134.o add135.o add136.o add137.o add138.o add139.o add140.o add141.o add142.o add143.o add144.o add145.o add146.o add147.o add148.o add149.o add150.o add151.o add152.o add153.o add154.o add155.o add156.o add157.o add158.o add159.o add160.o add161.o add162.o add163.o add164.o add165.o add166.o add167.o add168.o add169.o add170.o add171.o add172.o add173.o add174.o add175.o add176.o add177.o add178.o add179.o add180.o add181.o add182.o add183.o add184.o add185.o add186.o add187.o add188.o add189.o add190.o add191.o add192.o add193.o add194.o add195.o add196.o add197.o add198.o add199.o add200.o add201.o add202.o add203.o add204.o add205.o add206.o add207.o add208.o add209.o add210.o add211.o add212.o add213.o add214.o add215.o add216.o add217.o add218.o add219.o add220.o add221.o add222.o add223.o add224.o add225.o add226.o add227.o add228.o add229.o add230.o add231.o add232.o add233.o add234.o add235.o add236.o add237.o add238.o add239.o add240.o add241.o add242.o add243.o add244.o add245.o add246.o add247.o add248.o add249.o add250.o add251.o add252.o add253.o add254.o add255.o
	$(CXX) -shared -o $@ $^

%.o: %.cu
	nvcc --compiler-options -fPIC -std=c++17 -ccbin $(CXX) -c -o $@ $<

add%.cu: template.cu
	cp $< $@
	sed -i "s/add/$(basename $@)/g" $@

.PHONY: clean
.PHONY: all

clean:
	rm -rf *.o *.so add*.cu

all: liblarge.so
