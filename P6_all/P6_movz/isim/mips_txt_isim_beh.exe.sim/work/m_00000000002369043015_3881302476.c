/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/software_data/ISE_data/P6_all/P6_movz/BEU.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {15U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {12U, 0U};
static unsigned int ng5[] = {3U, 0U};
static unsigned int ng6[] = {2U, 0U};
static unsigned int ng7[] = {4U, 0U};
static unsigned int ng8[] = {8U, 0U};



static void Always_14_0(char *t0)
{
    char t9[8];
    char t16[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;

LAB0:    t1 = (t0 + 2848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(14, ng0);
    t2 = (t0 + 3168);
    *((int *)t2) = 1;
    t3 = (t0 + 2880);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(14, ng0);

LAB5:    xsi_set_current_line(15, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t4, 3);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB13;

LAB14:
LAB16:
LAB15:    xsi_set_current_line(54, ng0);

LAB63:    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(56, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 1928);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 32);

LAB17:    goto LAB2;

LAB7:    xsi_set_current_line(16, ng0);

LAB18:    xsi_set_current_line(17, ng0);
    t7 = ((char*)((ng2)));
    t8 = (t0 + 1768);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 4);
    xsi_set_current_line(18, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 1928);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 32);
    goto LAB17;

LAB9:    xsi_set_current_line(20, ng0);

LAB19:    xsi_set_current_line(21, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    memset(t9, 0, 8);
    t3 = (t9 + 4);
    t7 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t11 = (t10 >> 1);
    t12 = (t11 & 1);
    *((unsigned int *)t9) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 1);
    t15 = (t14 & 1);
    *((unsigned int *)t3) = t15;
    t8 = ((char*)((ng3)));
    memset(t16, 0, 8);
    t17 = (t9 + 4);
    t18 = (t8 + 4);
    t19 = *((unsigned int *)t9);
    t20 = *((unsigned int *)t8);
    t21 = (t19 ^ t20);
    t22 = *((unsigned int *)t17);
    t23 = *((unsigned int *)t18);
    t24 = (t22 ^ t23);
    t25 = (t21 | t24);
    t26 = *((unsigned int *)t17);
    t27 = *((unsigned int *)t18);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB23;

LAB20:    if (t28 != 0)
        goto LAB22;

LAB21:    *((unsigned int *)t16) = 1;

LAB23:    t32 = (t16 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (~(t33));
    t35 = *((unsigned int *)t16);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB24;

LAB25:    xsi_set_current_line(25, ng0);

LAB28:    xsi_set_current_line(26, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(27, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    memset(t16, 0, 8);
    t2 = (t16 + 4);
    t4 = (t3 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (t10 >> 0);
    *((unsigned int *)t16) = t11;
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 0);
    *((unsigned int *)t2) = t13;
    t14 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t14 & 65535U);
    t15 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t15 & 65535U);
    t7 = ((char*)((ng1)));
    xsi_vlogtype_concat(t9, 32, 32, 2U, t7, 16, t16, 16);
    t8 = (t0 + 1928);
    xsi_vlogvar_assign_value(t8, t9, 0, 0, 32);

LAB26:    goto LAB17;

LAB11:    xsi_set_current_line(30, ng0);

LAB29:    xsi_set_current_line(31, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    memset(t9, 0, 8);
    t3 = (t9 + 4);
    t7 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t11 = (t10 >> 0);
    *((unsigned int *)t9) = t11;
    t12 = *((unsigned int *)t7);
    t13 = (t12 >> 0);
    *((unsigned int *)t3) = t13;
    t14 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t14 & 3U);
    t15 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t15 & 3U);
    t8 = ((char*)((ng1)));
    memset(t16, 0, 8);
    t17 = (t9 + 4);
    t18 = (t8 + 4);
    t19 = *((unsigned int *)t9);
    t20 = *((unsigned int *)t8);
    t21 = (t19 ^ t20);
    t22 = *((unsigned int *)t17);
    t23 = *((unsigned int *)t18);
    t24 = (t22 ^ t23);
    t25 = (t21 | t24);
    t26 = *((unsigned int *)t17);
    t27 = *((unsigned int *)t18);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB33;

LAB30:    if (t28 != 0)
        goto LAB32;

LAB31:    *((unsigned int *)t16) = 1;

LAB33:    t32 = (t16 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (~(t33));
    t35 = *((unsigned int *)t16);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB34;

LAB35:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    memset(t9, 0, 8);
    t2 = (t9 + 4);
    t4 = (t3 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (t10 >> 0);
    *((unsigned int *)t9) = t11;
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 0);
    *((unsigned int *)t2) = t13;
    t14 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t14 & 3U);
    t15 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t15 & 3U);
    t7 = ((char*)((ng3)));
    memset(t16, 0, 8);
    t8 = (t9 + 4);
    t17 = (t7 + 4);
    t19 = *((unsigned int *)t9);
    t20 = *((unsigned int *)t7);
    t21 = (t19 ^ t20);
    t22 = *((unsigned int *)t8);
    t23 = *((unsigned int *)t17);
    t24 = (t22 ^ t23);
    t25 = (t21 | t24);
    t26 = *((unsigned int *)t8);
    t27 = *((unsigned int *)t17);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB41;

LAB38:    if (t28 != 0)
        goto LAB40;

LAB39:    *((unsigned int *)t16) = 1;

LAB41:    t31 = (t16 + 4);
    t33 = *((unsigned int *)t31);
    t34 = (~(t33));
    t35 = *((unsigned int *)t16);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB42;

LAB43:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    memset(t9, 0, 8);
    t2 = (t9 + 4);
    t4 = (t3 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (t10 >> 0);
    *((unsigned int *)t9) = t11;
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 0);
    *((unsigned int *)t2) = t13;
    t14 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t14 & 3U);
    t15 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t15 & 3U);
    t7 = ((char*)((ng6)));
    memset(t16, 0, 8);
    t8 = (t9 + 4);
    t17 = (t7 + 4);
    t19 = *((unsigned int *)t9);
    t20 = *((unsigned int *)t7);
    t21 = (t19 ^ t20);
    t22 = *((unsigned int *)t8);
    t23 = *((unsigned int *)t17);
    t24 = (t22 ^ t23);
    t25 = (t21 | t24);
    t26 = *((unsigned int *)t8);
    t27 = *((unsigned int *)t17);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB49;

LAB46:    if (t28 != 0)
        goto LAB48;

LAB47:    *((unsigned int *)t16) = 1;

LAB49:    t31 = (t16 + 4);
    t33 = *((unsigned int *)t31);
    t34 = (~(t33));
    t35 = *((unsigned int *)t16);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB50;

LAB51:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    memset(t9, 0, 8);
    t2 = (t9 + 4);
    t4 = (t3 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (t10 >> 0);
    *((unsigned int *)t9) = t11;
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 0);
    *((unsigned int *)t2) = t13;
    t14 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t14 & 3U);
    t15 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t15 & 3U);
    t7 = ((char*)((ng5)));
    memset(t16, 0, 8);
    t8 = (t9 + 4);
    t17 = (t7 + 4);
    t19 = *((unsigned int *)t9);
    t20 = *((unsigned int *)t7);
    t21 = (t19 ^ t20);
    t22 = *((unsigned int *)t8);
    t23 = *((unsigned int *)t17);
    t24 = (t22 ^ t23);
    t25 = (t21 | t24);
    t26 = *((unsigned int *)t8);
    t27 = *((unsigned int *)t17);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB57;

LAB54:    if (t28 != 0)
        goto LAB56;

LAB55:    *((unsigned int *)t16) = 1;

LAB57:    t31 = (t16 + 4);
    t33 = *((unsigned int *)t31);
    t34 = (~(t33));
    t35 = *((unsigned int *)t16);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB58;

LAB59:
LAB60:
LAB52:
LAB44:
LAB36:    goto LAB17;

LAB13:    xsi_set_current_line(49, ng0);

LAB62:    xsi_set_current_line(50, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1768);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 1928);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 32);
    goto LAB17;

LAB22:    t31 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB23;

LAB24:    xsi_set_current_line(21, ng0);

LAB27:    xsi_set_current_line(22, ng0);
    t38 = ((char*)((ng4)));
    t39 = (t0 + 1768);
    xsi_vlogvar_assign_value(t39, t38, 0, 0, 4);
    xsi_set_current_line(23, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    memset(t16, 0, 8);
    t3 = (t16 + 4);
    t7 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t11 = (t10 >> 0);
    *((unsigned int *)t16) = t11;
    t12 = *((unsigned int *)t7);
    t13 = (t12 >> 0);
    *((unsigned int *)t3) = t13;
    t14 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t14 & 65535U);
    t15 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t15 & 65535U);
    xsi_vlogtype_concat(t9, 32, 32, 2U, t16, 16, t2, 16);
    t8 = (t0 + 1928);
    xsi_vlogvar_assign_value(t8, t9, 0, 0, 32);
    goto LAB26;

LAB32:    t31 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB33;

LAB34:    xsi_set_current_line(31, ng0);

LAB37:    xsi_set_current_line(32, ng0);
    t38 = ((char*)((ng3)));
    t39 = (t0 + 1768);
    xsi_vlogvar_assign_value(t39, t38, 0, 0, 4);
    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    memset(t16, 0, 8);
    t2 = (t16 + 4);
    t4 = (t3 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (t10 >> 0);
    *((unsigned int *)t16) = t11;
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 0);
    *((unsigned int *)t2) = t13;
    t14 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t14 & 255U);
    t15 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t15 & 255U);
    t7 = ((char*)((ng1)));
    xsi_vlogtype_concat(t9, 32, 32, 2U, t7, 24, t16, 8);
    t8 = (t0 + 1928);
    xsi_vlogvar_assign_value(t8, t9, 0, 0, 32);
    goto LAB36;

LAB40:    t18 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB41;

LAB42:    xsi_set_current_line(35, ng0);

LAB45:    xsi_set_current_line(36, ng0);
    t32 = ((char*)((ng6)));
    t38 = (t0 + 1768);
    xsi_vlogvar_assign_value(t38, t32, 0, 0, 4);
    xsi_set_current_line(37, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    memset(t16, 0, 8);
    t3 = (t16 + 4);
    t7 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t11 = (t10 >> 0);
    *((unsigned int *)t16) = t11;
    t12 = *((unsigned int *)t7);
    t13 = (t12 >> 0);
    *((unsigned int *)t3) = t13;
    t14 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t14 & 255U);
    t15 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t15 & 255U);
    t8 = ((char*)((ng1)));
    xsi_vlogtype_concat(t9, 32, 32, 3U, t8, 16, t16, 8, t2, 8);
    t17 = (t0 + 1928);
    xsi_vlogvar_assign_value(t17, t9, 0, 0, 32);
    goto LAB44;

LAB48:    t18 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB49;

LAB50:    xsi_set_current_line(39, ng0);

LAB53:    xsi_set_current_line(40, ng0);
    t32 = ((char*)((ng7)));
    t38 = (t0 + 1768);
    xsi_vlogvar_assign_value(t38, t32, 0, 0, 4);
    xsi_set_current_line(41, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    memset(t16, 0, 8);
    t3 = (t16 + 4);
    t7 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t11 = (t10 >> 0);
    *((unsigned int *)t16) = t11;
    t12 = *((unsigned int *)t7);
    t13 = (t12 >> 0);
    *((unsigned int *)t3) = t13;
    t14 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t14 & 255U);
    t15 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t15 & 255U);
    t8 = ((char*)((ng1)));
    xsi_vlogtype_concat(t9, 32, 32, 3U, t8, 8, t16, 8, t2, 16);
    t17 = (t0 + 1928);
    xsi_vlogvar_assign_value(t17, t9, 0, 0, 32);
    goto LAB52;

LAB56:    t18 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB57;

LAB58:    xsi_set_current_line(43, ng0);

LAB61:    xsi_set_current_line(44, ng0);
    t32 = ((char*)((ng8)));
    t38 = (t0 + 1768);
    xsi_vlogvar_assign_value(t38, t32, 0, 0, 4);
    xsi_set_current_line(45, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    memset(t16, 0, 8);
    t3 = (t16 + 4);
    t7 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t11 = (t10 >> 0);
    *((unsigned int *)t16) = t11;
    t12 = *((unsigned int *)t7);
    t13 = (t12 >> 0);
    *((unsigned int *)t3) = t13;
    t14 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t14 & 255U);
    t15 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t15 & 255U);
    xsi_vlogtype_concat(t9, 32, 32, 2U, t16, 8, t2, 24);
    t8 = (t0 + 1928);
    xsi_vlogvar_assign_value(t8, t9, 0, 0, 32);
    goto LAB60;

}


extern void work_m_00000000002369043015_3881302476_init()
{
	static char *pe[] = {(void *)Always_14_0};
	xsi_register_didat("work_m_00000000002369043015_3881302476", "isim/mips_txt_isim_beh.exe.sim/work/m_00000000002369043015_3881302476.didat");
	xsi_register_executes(pe);
}
