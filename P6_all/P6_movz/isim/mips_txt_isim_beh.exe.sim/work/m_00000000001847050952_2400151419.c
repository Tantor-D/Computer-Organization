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
static const char *ng0 = "E:/software_data/ISE_data/P6_all/P6_movz/DM_ext.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static int ng3[] = {24, 0};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {3U, 0U};
static int ng6[] = {16, 0};
static unsigned int ng7[] = {4U, 0U};



static void Always_14_0(char *t0)
{
    char t9[8];
    char t16[8];
    char t38[8];
    char t39[8];
    char t49[8];
    char t53[8];
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
    char *t40;
    char *t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    char *t50;
    char *t51;
    char *t52;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t61;

LAB0:    t1 = (t0 + 2688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(14, ng0);
    t2 = (t0 + 3008);
    *((int *)t2) = 1;
    t3 = (t0 + 2720);
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

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB15;

LAB16:
LAB18:
LAB17:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 1768);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 32);

LAB19:    goto LAB2;

LAB7:    xsi_set_current_line(16, ng0);

LAB20:    xsi_set_current_line(17, ng0);
    t7 = (t0 + 1368U);
    t8 = *((char **)t7);
    t7 = (t0 + 1768);
    xsi_vlogvar_assign_value(t7, t8, 0, 0, 32);
    goto LAB19;

LAB9:    xsi_set_current_line(19, ng0);

LAB21:    xsi_set_current_line(20, ng0);
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
        goto LAB25;

LAB22:    if (t28 != 0)
        goto LAB24;

LAB23:    *((unsigned int *)t16) = 1;

LAB25:    t32 = (t16 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (~(t33));
    t35 = *((unsigned int *)t16);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB26;

LAB27:    xsi_set_current_line(21, ng0);
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
    t7 = ((char*)((ng2)));
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
        goto LAB32;

LAB29:    if (t28 != 0)
        goto LAB31;

LAB30:    *((unsigned int *)t16) = 1;

LAB32:    t31 = (t16 + 4);
    t33 = *((unsigned int *)t31);
    t34 = (~(t33));
    t35 = *((unsigned int *)t16);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB33;

LAB34:    xsi_set_current_line(22, ng0);
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
    t7 = ((char*)((ng4)));
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
        goto LAB39;

LAB36:    if (t28 != 0)
        goto LAB38;

LAB37:    *((unsigned int *)t16) = 1;

LAB39:    t31 = (t16 + 4);
    t33 = *((unsigned int *)t31);
    t34 = (~(t33));
    t35 = *((unsigned int *)t16);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB40;

LAB41:    xsi_set_current_line(23, ng0);
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
        goto LAB46;

LAB43:    if (t28 != 0)
        goto LAB45;

LAB44:    *((unsigned int *)t16) = 1;

LAB46:    t31 = (t16 + 4);
    t33 = *((unsigned int *)t31);
    t34 = (~(t33));
    t35 = *((unsigned int *)t16);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB47;

LAB48:
LAB49:
LAB42:
LAB35:
LAB28:    goto LAB19;

LAB11:    xsi_set_current_line(25, ng0);

LAB50:    xsi_set_current_line(26, ng0);
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
        goto LAB54;

LAB51:    if (t28 != 0)
        goto LAB53;

LAB52:    *((unsigned int *)t16) = 1;

LAB54:    t32 = (t16 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (~(t33));
    t35 = *((unsigned int *)t16);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB55;

LAB56:    xsi_set_current_line(27, ng0);
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
    t7 = ((char*)((ng2)));
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
        goto LAB61;

LAB58:    if (t28 != 0)
        goto LAB60;

LAB59:    *((unsigned int *)t16) = 1;

LAB61:    t31 = (t16 + 4);
    t33 = *((unsigned int *)t31);
    t34 = (~(t33));
    t35 = *((unsigned int *)t16);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB62;

LAB63:    xsi_set_current_line(28, ng0);
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
    t7 = ((char*)((ng4)));
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
        goto LAB68;

LAB65:    if (t28 != 0)
        goto LAB67;

LAB66:    *((unsigned int *)t16) = 1;

LAB68:    t31 = (t16 + 4);
    t33 = *((unsigned int *)t31);
    t34 = (~(t33));
    t35 = *((unsigned int *)t16);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB69;

LAB70:    xsi_set_current_line(29, ng0);
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
        goto LAB75;

LAB72:    if (t28 != 0)
        goto LAB74;

LAB73:    *((unsigned int *)t16) = 1;

LAB75:    t31 = (t16 + 4);
    t33 = *((unsigned int *)t31);
    t34 = (~(t33));
    t35 = *((unsigned int *)t16);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB76;

LAB77:
LAB78:
LAB71:
LAB64:
LAB57:    goto LAB19;

LAB13:    xsi_set_current_line(31, ng0);

LAB79:    xsi_set_current_line(32, ng0);
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
    t8 = ((char*)((ng2)));
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
        goto LAB83;

LAB80:    if (t28 != 0)
        goto LAB82;

LAB81:    *((unsigned int *)t16) = 1;

LAB83:    t32 = (t16 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (~(t33));
    t35 = *((unsigned int *)t16);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB84;

LAB85:    xsi_set_current_line(33, ng0);
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
    t7 = ((char*)((ng6)));
    t8 = (t0 + 1368U);
    t17 = *((char **)t8);
    memset(t39, 0, 8);
    t8 = (t39 + 4);
    t18 = (t17 + 4);
    t19 = *((unsigned int *)t17);
    t20 = (t19 >> 15);
    t21 = (t20 & 1);
    *((unsigned int *)t39) = t21;
    t22 = *((unsigned int *)t18);
    t23 = (t22 >> 15);
    t24 = (t23 & 1);
    *((unsigned int *)t8) = t24;
    xsi_vlog_mul_concat(t38, 16, 1, t7, 1U, t39, 1);
    xsi_vlogtype_concat(t9, 32, 32, 2U, t38, 16, t16, 16);
    t31 = (t0 + 1768);
    xsi_vlogvar_assign_value(t31, t9, 0, 0, 32);

LAB86:    goto LAB19;

LAB15:    xsi_set_current_line(35, ng0);

LAB87:    xsi_set_current_line(36, ng0);
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
    t8 = ((char*)((ng2)));
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
        goto LAB91;

LAB88:    if (t28 != 0)
        goto LAB90;

LAB89:    *((unsigned int *)t16) = 1;

LAB91:    t32 = (t16 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (~(t33));
    t35 = *((unsigned int *)t16);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB92;

LAB93:    xsi_set_current_line(37, ng0);
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
    t8 = (t0 + 1768);
    xsi_vlogvar_assign_value(t8, t9, 0, 0, 32);

LAB94:    goto LAB19;

LAB24:    t31 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB25;

LAB26:    xsi_set_current_line(20, ng0);
    t40 = (t0 + 1368U);
    t41 = *((char **)t40);
    memset(t39, 0, 8);
    t40 = (t39 + 4);
    t42 = (t41 + 4);
    t43 = *((unsigned int *)t41);
    t44 = (t43 >> 0);
    *((unsigned int *)t39) = t44;
    t45 = *((unsigned int *)t42);
    t46 = (t45 >> 0);
    *((unsigned int *)t40) = t46;
    t47 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t47 & 255U);
    t48 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t48 & 255U);
    t50 = ((char*)((ng3)));
    t51 = (t0 + 1368U);
    t52 = *((char **)t51);
    memset(t53, 0, 8);
    t51 = (t53 + 4);
    t54 = (t52 + 4);
    t55 = *((unsigned int *)t52);
    t56 = (t55 >> 7);
    t57 = (t56 & 1);
    *((unsigned int *)t53) = t57;
    t58 = *((unsigned int *)t54);
    t59 = (t58 >> 7);
    t60 = (t59 & 1);
    *((unsigned int *)t51) = t60;
    xsi_vlog_mul_concat(t49, 24, 1, t50, 1U, t53, 1);
    xsi_vlogtype_concat(t38, 32, 32, 2U, t49, 24, t39, 8);
    t61 = (t0 + 1768);
    xsi_vlogvar_assign_value(t61, t38, 0, 0, 32);
    goto LAB28;

LAB31:    t18 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB32;

LAB33:    xsi_set_current_line(21, ng0);
    t32 = (t0 + 1368U);
    t40 = *((char **)t32);
    memset(t39, 0, 8);
    t32 = (t39 + 4);
    t41 = (t40 + 4);
    t43 = *((unsigned int *)t40);
    t44 = (t43 >> 8);
    *((unsigned int *)t39) = t44;
    t45 = *((unsigned int *)t41);
    t46 = (t45 >> 8);
    *((unsigned int *)t32) = t46;
    t47 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t47 & 255U);
    t48 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t48 & 255U);
    t42 = ((char*)((ng3)));
    t50 = (t0 + 1368U);
    t51 = *((char **)t50);
    memset(t53, 0, 8);
    t50 = (t53 + 4);
    t52 = (t51 + 4);
    t55 = *((unsigned int *)t51);
    t56 = (t55 >> 15);
    t57 = (t56 & 1);
    *((unsigned int *)t53) = t57;
    t58 = *((unsigned int *)t52);
    t59 = (t58 >> 15);
    t60 = (t59 & 1);
    *((unsigned int *)t50) = t60;
    xsi_vlog_mul_concat(t49, 24, 1, t42, 1U, t53, 1);
    xsi_vlogtype_concat(t38, 32, 32, 2U, t49, 24, t39, 8);
    t54 = (t0 + 1768);
    xsi_vlogvar_assign_value(t54, t38, 0, 0, 32);
    goto LAB35;

LAB38:    t18 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB39;

LAB40:    xsi_set_current_line(22, ng0);
    t32 = (t0 + 1368U);
    t40 = *((char **)t32);
    memset(t39, 0, 8);
    t32 = (t39 + 4);
    t41 = (t40 + 4);
    t43 = *((unsigned int *)t40);
    t44 = (t43 >> 16);
    *((unsigned int *)t39) = t44;
    t45 = *((unsigned int *)t41);
    t46 = (t45 >> 16);
    *((unsigned int *)t32) = t46;
    t47 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t47 & 255U);
    t48 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t48 & 255U);
    t42 = ((char*)((ng3)));
    t50 = (t0 + 1368U);
    t51 = *((char **)t50);
    memset(t53, 0, 8);
    t50 = (t53 + 4);
    t52 = (t51 + 4);
    t55 = *((unsigned int *)t51);
    t56 = (t55 >> 23);
    t57 = (t56 & 1);
    *((unsigned int *)t53) = t57;
    t58 = *((unsigned int *)t52);
    t59 = (t58 >> 23);
    t60 = (t59 & 1);
    *((unsigned int *)t50) = t60;
    xsi_vlog_mul_concat(t49, 24, 1, t42, 1U, t53, 1);
    xsi_vlogtype_concat(t38, 32, 32, 2U, t49, 24, t39, 8);
    t54 = (t0 + 1768);
    xsi_vlogvar_assign_value(t54, t38, 0, 0, 32);
    goto LAB42;

LAB45:    t18 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB46;

LAB47:    xsi_set_current_line(23, ng0);
    t32 = (t0 + 1368U);
    t40 = *((char **)t32);
    memset(t39, 0, 8);
    t32 = (t39 + 4);
    t41 = (t40 + 4);
    t43 = *((unsigned int *)t40);
    t44 = (t43 >> 24);
    *((unsigned int *)t39) = t44;
    t45 = *((unsigned int *)t41);
    t46 = (t45 >> 24);
    *((unsigned int *)t32) = t46;
    t47 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t47 & 255U);
    t48 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t48 & 255U);
    t42 = ((char*)((ng3)));
    t50 = (t0 + 1368U);
    t51 = *((char **)t50);
    memset(t53, 0, 8);
    t50 = (t53 + 4);
    t52 = (t51 + 4);
    t55 = *((unsigned int *)t51);
    t56 = (t55 >> 31);
    t57 = (t56 & 1);
    *((unsigned int *)t53) = t57;
    t58 = *((unsigned int *)t52);
    t59 = (t58 >> 31);
    t60 = (t59 & 1);
    *((unsigned int *)t50) = t60;
    xsi_vlog_mul_concat(t49, 24, 1, t42, 1U, t53, 1);
    xsi_vlogtype_concat(t38, 32, 32, 2U, t49, 24, t39, 8);
    t54 = (t0 + 1768);
    xsi_vlogvar_assign_value(t54, t38, 0, 0, 32);
    goto LAB49;

LAB53:    t31 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB54;

LAB55:    xsi_set_current_line(26, ng0);
    t40 = (t0 + 1368U);
    t41 = *((char **)t40);
    memset(t39, 0, 8);
    t40 = (t39 + 4);
    t42 = (t41 + 4);
    t43 = *((unsigned int *)t41);
    t44 = (t43 >> 0);
    *((unsigned int *)t39) = t44;
    t45 = *((unsigned int *)t42);
    t46 = (t45 >> 0);
    *((unsigned int *)t40) = t46;
    t47 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t47 & 255U);
    t48 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t48 & 255U);
    t50 = ((char*)((ng1)));
    xsi_vlogtype_concat(t38, 32, 32, 2U, t50, 24, t39, 8);
    t51 = (t0 + 1768);
    xsi_vlogvar_assign_value(t51, t38, 0, 0, 32);
    goto LAB57;

LAB60:    t18 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB61;

LAB62:    xsi_set_current_line(27, ng0);
    t32 = (t0 + 1368U);
    t40 = *((char **)t32);
    memset(t39, 0, 8);
    t32 = (t39 + 4);
    t41 = (t40 + 4);
    t43 = *((unsigned int *)t40);
    t44 = (t43 >> 8);
    *((unsigned int *)t39) = t44;
    t45 = *((unsigned int *)t41);
    t46 = (t45 >> 8);
    *((unsigned int *)t32) = t46;
    t47 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t47 & 255U);
    t48 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t48 & 255U);
    t42 = ((char*)((ng1)));
    xsi_vlogtype_concat(t38, 32, 32, 2U, t42, 24, t39, 8);
    t50 = (t0 + 1768);
    xsi_vlogvar_assign_value(t50, t38, 0, 0, 32);
    goto LAB64;

LAB67:    t18 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB68;

LAB69:    xsi_set_current_line(28, ng0);
    t32 = (t0 + 1368U);
    t40 = *((char **)t32);
    memset(t39, 0, 8);
    t32 = (t39 + 4);
    t41 = (t40 + 4);
    t43 = *((unsigned int *)t40);
    t44 = (t43 >> 16);
    *((unsigned int *)t39) = t44;
    t45 = *((unsigned int *)t41);
    t46 = (t45 >> 16);
    *((unsigned int *)t32) = t46;
    t47 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t47 & 255U);
    t48 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t48 & 255U);
    t42 = ((char*)((ng1)));
    xsi_vlogtype_concat(t38, 32, 32, 2U, t42, 24, t39, 8);
    t50 = (t0 + 1768);
    xsi_vlogvar_assign_value(t50, t38, 0, 0, 32);
    goto LAB71;

LAB74:    t18 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB75;

LAB76:    xsi_set_current_line(29, ng0);
    t32 = (t0 + 1368U);
    t40 = *((char **)t32);
    memset(t39, 0, 8);
    t32 = (t39 + 4);
    t41 = (t40 + 4);
    t43 = *((unsigned int *)t40);
    t44 = (t43 >> 24);
    *((unsigned int *)t39) = t44;
    t45 = *((unsigned int *)t41);
    t46 = (t45 >> 24);
    *((unsigned int *)t32) = t46;
    t47 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t47 & 255U);
    t48 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t48 & 255U);
    t42 = ((char*)((ng1)));
    xsi_vlogtype_concat(t38, 32, 32, 2U, t42, 24, t39, 8);
    t50 = (t0 + 1768);
    xsi_vlogvar_assign_value(t50, t38, 0, 0, 32);
    goto LAB78;

LAB82:    t31 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB83;

LAB84:    xsi_set_current_line(32, ng0);
    t40 = (t0 + 1368U);
    t41 = *((char **)t40);
    memset(t39, 0, 8);
    t40 = (t39 + 4);
    t42 = (t41 + 4);
    t43 = *((unsigned int *)t41);
    t44 = (t43 >> 16);
    *((unsigned int *)t39) = t44;
    t45 = *((unsigned int *)t42);
    t46 = (t45 >> 16);
    *((unsigned int *)t40) = t46;
    t47 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t47 & 65535U);
    t48 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t48 & 65535U);
    t50 = ((char*)((ng6)));
    t51 = (t0 + 1368U);
    t52 = *((char **)t51);
    memset(t53, 0, 8);
    t51 = (t53 + 4);
    t54 = (t52 + 4);
    t55 = *((unsigned int *)t52);
    t56 = (t55 >> 31);
    t57 = (t56 & 1);
    *((unsigned int *)t53) = t57;
    t58 = *((unsigned int *)t54);
    t59 = (t58 >> 31);
    t60 = (t59 & 1);
    *((unsigned int *)t51) = t60;
    xsi_vlog_mul_concat(t49, 16, 1, t50, 1U, t53, 1);
    xsi_vlogtype_concat(t38, 32, 32, 2U, t49, 16, t39, 16);
    t61 = (t0 + 1768);
    xsi_vlogvar_assign_value(t61, t38, 0, 0, 32);
    goto LAB86;

LAB90:    t31 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB91;

LAB92:    xsi_set_current_line(36, ng0);
    t40 = (t0 + 1368U);
    t41 = *((char **)t40);
    memset(t39, 0, 8);
    t40 = (t39 + 4);
    t42 = (t41 + 4);
    t43 = *((unsigned int *)t41);
    t44 = (t43 >> 16);
    *((unsigned int *)t39) = t44;
    t45 = *((unsigned int *)t42);
    t46 = (t45 >> 16);
    *((unsigned int *)t40) = t46;
    t47 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t47 & 65535U);
    t48 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t48 & 65535U);
    t50 = ((char*)((ng1)));
    xsi_vlogtype_concat(t38, 32, 32, 2U, t50, 16, t39, 16);
    t51 = (t0 + 1768);
    xsi_vlogvar_assign_value(t51, t38, 0, 0, 32);
    goto LAB94;

}


extern void work_m_00000000001847050952_2400151419_init()
{
	static char *pe[] = {(void *)Always_14_0};
	xsi_register_didat("work_m_00000000001847050952_2400151419", "isim/mips_txt_isim_beh.exe.sim/work/m_00000000001847050952_2400151419.didat");
	xsi_register_executes(pe);
}
