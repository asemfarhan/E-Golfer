                                                                
/****************************************************************
 *
 *                    Source Code Generated by
 *                           CA Gen 8.6
 *
 *    Copyright (c) 2017 CA Technologies. All rights reserved.
 *
 *      TARGET OS:  WINDOWS            DBMS:  MS/SQL          
 *
 *      ACCESS METHOD:  ODBC/ADO.NET        
 *
 *        Name:  DIS-SCORING_RECORD-GOLFER
 *
 *      UserID:   mansour
 *
 *        Date:  2017/07/17  Time:  22:14:05
 *
 ***************************************************************/
/****************************************************************
 Data declarations
 ***************************************************************/
static char ief_cgen_rlse[] = "CA Gen 8.6";
static char * ss_copyright = "Copyright (c) 2017 CA Technologies. All rights reserved.";
static char ief_cgen_date[] = "2017/07/17";
static char ief_cgen_time[] = "22:14:05";
static char ief_pgmrname[9] = " mansour";
#define TGT_ANSI
#define TGT_INTERNAL
#define TGT_DASG 1
#define TGT_ODBC 1
#include <tiabinc.h>
/***************************************************************
 * internal flag used for delete/disassociate td action block  *
 ***************************************************************/
TGTSTATIC char dl_0203423770[3];
static struct scoring_reco_001dr  *pscoring_reco_001dr;
static struct golfer_031dr  *pgolfer_031dr;
static double NonStopDouble;
static void f_203423770_evaluate(void);
static void f_53477377_qdelete(void);
static void f_23068713_odbc_dberror(TIHSTMT * tihstmt);
static char long64bit_len[5];
/*    View for Table SCORING_RECORD */
static struct scoring_reco_001dr
{
DATE_STRUCT date0_005ef;
TIMESTAMP_STRUCT time0_009ef;
UCHAR FAR fk_golferuse_029ef[9] /* 8 + 1 */;
} scoring_reco_001dr;

/* 

   TIDDAQUE calling struct for Table SCORING_RECORD */
static struct
{
char dqa_rel_stamp[8];
char dqa_number_pairs[4];
char date0_005ef_dqa_len[4];
char date0_005ef_dqa[sizeof(DATE_STRUCT)];
char time0_009ef_dqa_len[4];
char time0_009ef_dqa[sizeof(TIMESTAMP_STRUCT)];
char fk_golferuse_029ef_dqa_len[4];
UCHAR FAR fk_golferuse_029ef_dqa[8];
} daq_scoring_reco_001dr =
{
{ '4', '.', '2', '.', ' ', ' ', ' ', ' ' },
{ '0', '0', '0', '3' },
{ '0', '0', '0', '6' }, "",
{ '0', '0', '0', '6' }, "",
{ '0', '0', '0', '8' }, "",
};

/*    View for Table GOLFER */
static struct golfer_031dr
{
UCHAR FAR userid_035ef[9] /* 8 + 1 */;
} golfer_031dr;

/* 

   TIDDAQUE calling struct for Table GOLFER */
static struct
{
char dqa_rel_stamp[8];
char dqa_number_pairs[4];
char userid_035ef_dqa_len[4];
UCHAR FAR userid_035ef_dqa[8];
} daq_golfer_031dr =
{
{ '4', '.', '2', '.', ' ', ' ', ' ', ' ' },
{ '0', '0', '0', '1' },
{ '0', '0', '0', '8' }, "",
};

static void f_203423770_error(void);


void F0003820(char  *in_runtime_parm1, char  *in_runtime_parm2, 
struct ief_globdata  *in_globdata, 
struct DA_QUEUE_CMCB  *in_pda_queue_cmcb, 
struct scoring_reco_001dr  *in_scoring_reco_001dr, 
struct golfer_031dr  *golfer_031dr) 
{
ief_runtime_parm1 = in_runtime_parm1;
ief_runtime_parm2 = in_runtime_parm2;
globdata = in_globdata;
pda_queue_cmcb = in_pda_queue_cmcb;
pscoring_reco_001dr = in_scoring_reco_001dr;
pgolfer_031dr = golfer_031dr;
 if (setjmp(excp_jumpbuf))
{
}
 else {
strcpy(globdata->psmgr_debug_data.cur_ab_id, "0203423770");

strcpy(globdata->psmgr_debug_data.cur_ab_name, "DIS-SCORING_RECORD-GOLFER");

strcpy(dl_0203423770, succeeds);

 if (info == 0)
{
info = (ODBC_INFO*)getODBCHandles();
}
f_203423770_evaluate();
}
return;
}



static void f_203423770_evaluate(void)
{
 if ((globdata->v1present == 'Y') &&
(globdata->v2present == 'N'))
{
}
 else  if ((globdata->v1present == 'N') &&
(globdata->v2present == 'Y'))
{
}
 else  if ((globdata->v1present == 'Y') &&
(globdata->v2present == 'Y'))
{
 if ((globdata->cascade1 == 'Y') &&
(globdata->cascade2 == 'Y'))
{
f_53477377_qdelete();
}
 else  if ((globdata->cascade1 == 'Y') &&
(globdata->cascade2 == 'N'))
{
 if (globdata->processq_flag == 'Y')
{
f_53477377_qdelete();
}
}
 else  if ((globdata->cascade1 == 'N') &&
(globdata->cascade2 == 'Y'))
{
 if (globdata->processq_flag == 'Y')
{
}
}
}
}


static void f_203423770_error(void)
{
strcpy(globdata->psmgr_dasg_data.status_flag, fatal_error);
 if (strcmp(dl_0203423770, succeeds) != 0)
strcpy(globdata->psmgr_dasg_data.last_status, dl_0203423770);
longjmp(excp_jumpbuf, FUNCTION_EXCEPTION);
}


/* Delete the source record from SCORING_RECORD */
static void f_53477377_qdelete(void)
{
globdata->processq_flag = 'N';
relmm_cgvalue = 1039L;
E0001035(ief_runtime_parm1,
    ief_runtime_parm2,
    globdata,
    pda_queue_cmcb,
    pscoring_reco_001dr,
    &relmm_cgvalue);
 if (strcmp(globdata->psmgr_dasg_data.status_flag, "  ") != 0)
f_203423770_error();
}

static void f_23068713_odbc_dberror(TIHSTMT * tihstmt)
{
TiodbcError(tihstmt);
memcpy(globdata->psmgr_dasg_data.save_sqlca,
    info->sqlca,
    sizeof(* info->sqlca));
strcpy(dl_0203423770, db_error);
f_203423770_error();
}

