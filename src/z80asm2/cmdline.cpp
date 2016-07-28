/* Generated by re2c */
//-----------------------------------------------------------------------------
// re2c source to parse command line arguments
// Copyright (c) Paulo Custodio, 2015-2016
// License: http://www.perlfoundation.org/artistic_license_2_0
//-----------------------------------------------------------------------------

#define YYMAXFILL 10

enum YYCONDTYPE {
		yycinit,
};


#include <iostream>
#include <fstream>
#include <string>
#include "cmdline.hpp"
#include "messages.hpp"
#include "util.hpp"

static void usage()
{
	g_messages.information(MES_COPYRIGHT);
	g_messages.plaintext("");
	g_messages.information(MES_USAGE);
}

static void help()
{
	g_messages.information(MES_COPYRIGHT);
	g_messages.plaintext("");
	g_messages.information(MES_USAGE);
	g_messages.plaintext("");
	g_messages.information(MES_HELP);
}

// append a file or the list of files from a '@'-list into the passed vector
static bool insert_file(std::string filename, 
						std::vector<std::string> & list)
{
	std::size_t size = filename.size();
	char prefix = (size == 0) ? '\0' : filename[0];
	
	if (size == 0 || prefix == '#' || prefix == ';') {
		// ignore
	}
	else if (prefix == '@') {
		filename.erase(0, 1);					// remove '@'
		
		std::ifstream file(filename.c_str());	// open list file
		if (!file.good()) {
			g_errors.error(ERR_READ_FILE, filename);
			return false;
		}
		else {
			std::string line;
			unsigned line_nr = 0;
			unsigned col_nr = 1;
			while (safeGetline(file, line)) {
				line_nr++;
				stlplus::message_position pos(filename, line_nr, col_nr);
				g_errors.push_context(pos, ERR_READ_CONTEXT, filename);
				
				insert_file(line, list);
				
				g_errors.pop_context();
			}
		}
	}
	else {
		list.push_back(filename);
	}
	
	return true;
}

// parse command line, accumulate arguments and options in out_args
// return false if no further processing should be done - error or usage/help
bool parse_cmdline(int argc, char *argv[], args_t& out_args)
{
	int arg;
	
	if (argc <= 1) {
		usage();
		return false;
	}

	// parse each argument
	int cond = yycinit;
	for (arg = 1; arg < argc; arg++) {
		const char *YYCURSOR = argv[arg];
		const char *YYMARKER;
		//const char *YYCTXMARKER;
		
{
		char yych;
		switch (cond) {
		case yycinit: goto yyc_init;
		}
/* *********************************** */
yyc_init:
		yych = *YYCURSOR;
		switch (yych) {
		case '\n':		goto yy5;
		case '-':		goto yy7;
		default:		goto yy3;
		}
yy3:
		++YYCURSOR;
		{ 	if (!insert_file(YYCURSOR - 1, out_args.files))
								return false;
							continue; 
						}
yy5:
		++YYCURSOR;
		{ 	g_errors.error(ERR_INVALID_OPTION, argv[arg]); 
							return false; 
						}
yy7:
		yych = *(YYMARKER = ++YYCURSOR);
		switch (yych) {
		case '-':		goto yy9;
		case 'h':		goto yy11;
		case 'v':		goto yy12;
		default:		goto yy8;
		}
yy8:
		{ 	g_errors.error(ERR_INVALID_OPTION, argv[arg]); 
							return false; 
						}
yy9:
		yych = *++YYCURSOR;
		switch (yych) {
		case 'h':		goto yy13;
		case 'v':		goto yy14;
		default:		goto yy10;
		}
yy10:
		YYCURSOR = YYMARKER;
		goto yy8;
yy11:
		yych = *++YYCURSOR;
		if (yych <= 0x00) goto yy15;
		goto yy10;
yy12:
		yych = *++YYCURSOR;
		if (yych <= 0x00) goto yy17;
		goto yy10;
yy13:
		yych = *++YYCURSOR;
		switch (yych) {
		case 'e':		goto yy19;
		default:		goto yy10;
		}
yy14:
		yych = *++YYCURSOR;
		switch (yych) {
		case 'e':		goto yy20;
		default:		goto yy10;
		}
yy15:
		++YYCURSOR;
		{ 	help(); 
							return false; 
						}
yy17:
		++YYCURSOR;
		{ 	out_args.is_verbose = true;
							continue;
						}
yy19:
		yych = *++YYCURSOR;
		switch (yych) {
		case 'l':		goto yy21;
		default:		goto yy10;
		}
yy20:
		yych = *++YYCURSOR;
		switch (yych) {
		case 'r':		goto yy22;
		default:		goto yy10;
		}
yy21:
		yych = *++YYCURSOR;
		switch (yych) {
		case 'p':		goto yy11;
		default:		goto yy10;
		}
yy22:
		yych = *++YYCURSOR;
		switch (yych) {
		case 'b':		goto yy23;
		default:		goto yy10;
		}
yy23:
		yych = *++YYCURSOR;
		switch (yych) {
		case 'o':		goto yy24;
		default:		goto yy10;
		}
yy24:
		yych = *++YYCURSOR;
		switch (yych) {
		case 's':		goto yy25;
		default:		goto yy10;
		}
yy25:
		++YYCURSOR;
		switch ((yych = *YYCURSOR)) {
		case 'e':		goto yy12;
		default:		goto yy10;
		}
}

	}
	return true;
}
