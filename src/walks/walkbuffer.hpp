#ifndef DEF_WALK_BUFFER
#define DEF_WALK_BUFFER


#include <cstring>
#include <vector>
#include "api/datatype.hpp"

class WalkBuffer{

public:
	bool malloced;
	wid_t size_w;
	WalkDataType *walks;
	//std::vector<WalkDataType> walks;

public:
	WalkBuffer() : malloced(false), size_w(0), walks(NULL) {
		//size_w = 0;
		//malloced = false;
		// walks = (WalkDataType*)malloc(WALK_BUFFER_SIZE*sizeof(WalkDataType));
	}

	~WalkBuffer(){
		if(size_w > 0 && walks != NULL){
			free(walks);
		}
	}

    WalkDataType& operator[] (int i){
        return walks[i];
    }

	void push_back(WalkDataType w){
//		if(((w >> 40) & 0xfffff) == 0x1711D) std::cout << w << ", " << size_w << std::endl;
		if(!malloced){
			assert(size_w == 0);
			walks = (WalkDataType*)malloc(WALK_BUFFER_SIZE*sizeof(WalkDataType));
			//walks.resize(WALK_BUFFER_SIZE);
			malloced = true;
		}
	walks[size_w++] = w;
	//walks.at(size_w++) = w;
	}
};

#endif
