unit VarsCons;

interface

var
  posy, posx : string;
  IsAutoRun, FirstRun, IsPassOK, NEED_LOG_CHECK, IS_WARNED_BY_PASS, IS_CONNECTION_EXISTS : boolean;
  check_period, cntcheck : integer;

  LOCATION, PASS, LOGIN, PASSMD5, BASELINK, INIFILE, SAVEDIR, KEYLIST, TEMPDIR : string;
  CNT_ACC_IMG, LAST_IMG, CNT_NEW_IMG, IMG_KEY, IMG_KEY_LOADED : integer;

const
  VERSION = '1.09';
  RUN_REG_KEY_32  = 'SOFTWARE\Microsoft\Windows\CurrentVersion\Run';
  RUN_REG_KEY_64  = 'SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run';
  PROG_REG_KEY_32 = 'SOFTWARE';
  PROG_REG_KEY_64 = '\SOFTWARE\Wow6432Node';
  PROGRAM_ID   = 'Greetfest.com';

  VERS_KEY = 'Version';
  AUTORUN_KEY = 'Autorun';
  STAY_ON_TOP_KEY = 'StayOnTop';
  CHECK_PERIOD_KEY = 'CheckPeriod';
  LOGIN_KEY = 'Login';
  PASS_KEY = 'Password';

  CHECK_PERIOD_VAL = 10;
  STAY_ON_TOP_VAL = '1';
  LOGIN_VAL = '';
  PASS_VAL = '';
  VAL_YES = '1';
  VAL_NO  = '0';
  VAL_NULL = '';

  GREETFEST_TEMP_FILE_PART = 'grtfst.tmp';

//  CNT_CHECKS = 10;

  RenewPeriodMinimum = 10;

  ACC_IMG_KEY_LIST_PARAM = 'imgaccepted';
  NEW_IMG_KEY_LIST_PARAM = 'imgnew';
  VERSION_PARAM = 'version';
  GETIMG   = 'getimg';
  GETSENDER = 'getsender';
  ACCEPTIMAGE = 'setimgaccepted';
  REFUSEIMAGE = 'setimgrefused';
  KEYSPLIT = ',';
  NO_IMG = 'error';

  USEREG = true; // false - вместо него используем ini

  EnterLogPass = 'Пожалуйста, укажите Ваши логин и пароль учетной записи сайта Greetfest.com (правый клик на иконке программы в трее -> Настройки)';
  APP_PROBLEM_GET_SETTS = 'Не удается считать настройки, обратитесь к разработчикам';
  PeriodRenewValFormatErr = 'В периоде проверки указано нечисловое значение';
  PeriodRenewValErr       = 'В периоде проверки указано некорректное значение';
  EmailFormatErr          = 'Указан некорректный e-mail';

  REFUSE_THIS_QUESTION = 'Вы хотите скрыть и больше не показывать этот подарок?';

  FRM_SETTS_MAX_WIDTH  = 852;
  FRM_SETTS_MAX_HEIGHT = 871;

  FRM_SETTS_MIN_WIDTH  = 209;
  FRM_SETTS_MIN_HEIGHT = 310;

  IS_LOG = true;


//  POSX_KEY = 'CoordX';
//  POSY_KEY = 'CoordY';


implementation

end.
