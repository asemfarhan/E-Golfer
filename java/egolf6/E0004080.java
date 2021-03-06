package egolf6;

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//
//                    Source Code Generated by
//                           CA Gen 8.6
//
//      TARGET OS:  JVM                DBMS:  JDBC            
//
//      ACCESS METHOD:  JDBC                //
//        Name:  DELETE-SCORE_CARD//
//      UserID:   mansour//
//        Date:  2017  Time:  22:14:53//
//    Copyright (c) 2017 CA Technologies. All rights reserved.//
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// Import Statements
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 
import java.lang.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import java.math.*;
import com.ca.gen.vwrt.*;
import com.ca.gen.vwrt.types.*;
import com.ca.gen.abrt.*;
import com.ca.gen.abrt.functions.*;
import com.ca.gen.abrt.cascade.*;
import com.ca.gen.abrt.trace.*;
import com.ca.gen.exits.common.*;
 
public class E0004080 extends ABBase
{
  // internal flag used for delete/disassociate td action block
  String dl_0118489145;
  int relmm_cgvalue;
  DAQueue pdaQueueCMCB;
  // * * * * * * * * * * * * * * * * * * *
  // HOST VARIABLES FOR TABLE: SCORE_CARD
  // * * * * * * * * * * * * * * * * * * *
  String fk_scoring_recofk_golferuserid_007EF;
  java.sql.Time fk_scoring_recotime0_011EF;
  java.sql.Date fk_scoring_recodate0_015EF;
  
  // * * * * * * * * * * * * * * * * * * *
  // VIEW FOR TABLE: SCORE_CARD
  // * * * * * * * * * * * * * * * * * * *
  String fk_scoring_recofk_golferuserid_009EF;
  java.sql.Time fk_scoring_recotime0_013EF;
  java.sql.Date fk_scoring_recodate0_017EF;
  
  // * * * * * * * * * * * * * * * * * * *
  // VIEW FOR TABLE: SCORING_RECORD
  // * * * * * * * * * * * * * * * * * * *
  java.sql.Date date0_023EF;
  java.sql.Time time0_027EF;
  String fk_golferuserid_047EF;
  
  
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  // MISC DECLARATIONS AND PROTOTYPES 
  //    FOLLOW AS NEEDED:             
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  PreparedStatement hstmt_0118489145_1;
  ResultSet hstmt_0118489145_1_rs;
  int hstmt_0118489145_1_cnt;
  
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  //  CONSTRUCTOR FOR THE CLASS       
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  public E0004080()
  {
    iefCGenRlse = "CA Gen 8.6";
    ssCopyright = "Copyright (c) 2017 CA Technologies. All rights reserved.";
    iefCGenDate = "2017/07/17";
    iefCGenTime = "22:14:53";
    iefCGenEncy = "9.2.A6";
    iefCGenUserId = "mansour";
    iefCGenModel = "EGOLF";
    iefCGenSubset = "ALL";
    iefCGenName = "E0004080";
  }
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  // FUNCTION DECLARATIONS 
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  
  
  
  public static void E0004080(Object in_runtime_parm1, IRuntimePStepContext in_runtime_parm2, GlobData in_globdata, DAQueue 
    in_pdaQueueCMCB, int in_relmm_cgvalue, String parm_fk_scoring_recofk_golferuserid_009EF, java.sql.Time 
    parm_fk_scoring_recotime0_013EF, java.sql.Date parm_fk_scoring_recodate0_017EF)
  {
    E0004080 obj = new E0004080();
    obj.iefRuntimeParm1 = in_runtime_parm1;
    obj.iefRuntimeParm2 = in_runtime_parm2;
    obj.globdata = in_globdata;
    obj.pdaQueueCMCB = in_pdaQueueCMCB;
    obj.relmm_cgvalue = in_relmm_cgvalue;
    obj.fk_scoring_recofk_golferuserid_009EF = parm_fk_scoring_recofk_golferuserid_009EF;
    obj.fk_scoring_recotime0_013EF = parm_fk_scoring_recotime0_013EF;
    obj.fk_scoring_recodate0_017EF = parm_fk_scoring_recodate0_017EF;
    obj.mainE0004080();
  }
  
  public void mainE0004080()
  {
    try {
      
      globdata.getStateData().setCurrentABId( "0118489145" );
      
      globdata.getStateData().setCurrentABName( "DELETE-SCORE_CARD" );
      
      dl_0118489145 = ErrorData.SUCCEEDS_FL_LS;
      
      f_118489145_delete();
      f_118489145_evaluate();
    } catch( ABException e ) {
    }
  }
  
  
  public void f_118489145_evaluate()
  	throws ABException
  {
    f_0118489145_evaluate_exit: 
    {
      if ( relmm_cgvalue == 0 )
      {
        f_4085();
        break f_0118489145_evaluate_exit;
      }
      throw new ABException();
    }
  }
  
  
  //   DELETE SCORE_CARD
  public void f_118489145_delete()
  	throws ABException
  {
    fk_scoring_recofk_golferuserid_007EF = fk_scoring_recofk_golferuserid_009EF;
    fk_scoring_recotime0_011EF = fk_scoring_recotime0_013EF;
    fk_scoring_recodate0_015EF = fk_scoring_recodate0_017EF;
    sqlException = null;
    try {
      if ( hstmt_0118489145_1 == null )
      {
        SQLStatement.setLength(0);
        
        SQLStatement.append("DELETE FROM ");
        SQLStatement.append("`SCORE_CARD`");
        SQLStatement.append(" WHERE ");
        SQLStatement.append("`FK_SCORING_RECOFK_GOLFERUSERID` = ?");
        SQLStatement.append(" AND `FK_SCORING_RECOTIME0` = ?");
        SQLStatement.append(" AND `FK_SCORING_RECODATE0` = ?");
        hstmt_0118489145_1 = globdata.getDBMSData().getDBMSManager().getStatement(globdata, iefRuntimeParm2, "golfer1", 
          SQLStatement.toString());
      }
      globdata.getDBMSData().getDBMSManager().bindParameterString("golfer1", hstmt_0118489145_1, 1, 
        fk_scoring_recofk_golferuserid_007EF);
      hstmt_0118489145_1.setTime(2, fk_scoring_recotime0_011EF);
      hstmt_0118489145_1.setDate(3, fk_scoring_recodate0_015EF);
      hstmt_0118489145_1.execute();
      hstmt_0118489145_1_rs = hstmt_0118489145_1.getResultSet();
      hstmt_0118489145_1_cnt = hstmt_0118489145_1.getUpdateCount();
    } catch( SQLException e ) {
      sqlException = e;
    }
    if ( ((globdata.getDBMSData().getDBMSManager().wasNoDataFound(sqlException)) || ((globdata.getDBMSData().getDBMSManager()
      .wasSuccessful(sqlException) && (hstmt_0118489145_1_cnt == 0 || hstmt_0118489145_1_cnt == -1)))) || ((globdata.getDBMSData()
      .getDBMSManager().wasSuccessful(sqlException) && hstmt_0118489145_1_cnt == 1)) )
    {
      try {
        if ( hstmt_0118489145_1_rs != null )
        {
          hstmt_0118489145_1_rs.close();
          hstmt_0118489145_1_rs = null;
        }
        if ( hstmt_0118489145_1 != null )
        {
          hstmt_0118489145_1.close();
          hstmt_0118489145_1 = null;
        }
      } catch( SQLException e ) {
        if ( globdata.getDBMSData().getDBMSManager().wasSuccessful(e) == false )
        {
          sqlException = e;
          f_118489145_jdbc_dberror();
        }
      }
    }
    else {
      f_118489145_jdbc_dberror();
    }
  }
  
  public void f_118489145_jdbc_dberror()
  	throws ABException
  {
    globdata.getDBMSData().setSaveSQLException( sqlException );
    if ( sqlException != null )
    {
      globdata.getErrorData().setErrorMessage(sqlException);
    }
    globdata.getErrorData().setLastStatus( ErrorData.DB_ERROR_FL_LS );
    f_118489145_error();
  }
  public void f_118489145_error()
  	throws ABException
  {
    globdata.getErrorData().setStatus( ErrorData.FATAL_ERROR_FL_LS );
    if ( dl_0118489145.equals( ErrorData.SUCCEEDS_FL_LS ) == false )
    {
      globdata.getErrorData().setLastStatus( dl_0118489145 );
    }
    throw new ABException();
  }
  
  
  //  DISASSOC RELMM DOCMENTS
  public void f_4085()
  	throws ABException
  {
    globdata.getDBMSData().setV1Present( true );
    globdata.getDBMSData().setV2Present( false );
    globdata.getDBMSData().setCascade1( false );
    globdata.getDBMSData().setCascade2( true );
    globdata.getDBMSData().setProcessQueue( false );
    egolf6.F0004888.F0004888(iefRuntimeParm1, iefRuntimeParm2, globdata, pdaQueueCMCB, fk_scoring_recofk_golferuserid_009EF, 
      fk_scoring_recotime0_013EF, fk_scoring_recodate0_017EF, date0_023EF, time0_027EF, fk_golferuserid_047EF);
    if ( globdata.getErrorData().getStatus().equals( ErrorData.NONE_SF ) == false )
    {
      f_118489145_error();
    }
  }
}// end class

