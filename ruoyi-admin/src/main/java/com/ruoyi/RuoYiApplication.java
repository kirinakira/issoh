package com.ruoyi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 * 
 * @author ruoyi
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class RuoYiApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(RuoYiApplication.class, args);
        System.out.println("０から１を創造する会社が、いっそう良い世の中に、変えていくことを表しています。     \n" +
                "(♥◠‿◠)ﾉﾞ  システム起動しました   ლ(´ڡ`ლ)ﾞissoh  \n" +
                "  iiii                                                     hhhhhhh             \n" +
                " i::::i                                                    h:::::h             \n" +
                "  iiii                                                     h:::::h             \n" +
                "                                                           h:::::h             \n" +
                "iiiiiii     ssssssssss       ssssssssss      ooooooooooo    h::::h hhhhh       \n" +
                "i:::::i   ss::::::::::s    ss::::::::::s   oo:::::::::::oo  h::::hh:::::hhh    \n" +
                " i::::i ss:::::::::::::s ss:::::::::::::s o:::::::::::::::o h::::::::::::::hh  \n" +
                " i::::i s::::::ssss:::::ss::::::ssss:::::so:::::ooooo:::::o h:::::::hhh::::::h \n" +
                " i::::i  s:::::s  ssssss  s:::::s  ssssss o::::o     o::::o h::::::h   h::::::h\n" +
                " i::::i    s::::::s         s::::::s      o::::o     o::::o h:::::h     h:::::h\n" +
                " i::::i       s::::::s         s::::::s   o::::o     o::::o h:::::h     h:::::h\n" +
                " i::::i ssssss   s:::::s ssssss   s:::::s o::::o     o::::o h:::::h     h:::::h\n" +
                "i::::::is:::::ssss::::::ss:::::ssss::::::so:::::ooooo:::::o h:::::h     h:::::h\n" +
                "i::::::is::::::::::::::s s::::::::::::::s o:::::::::::::::o h:::::h     h:::::h\n" +
                "i::::::i s:::::::::::ss   s:::::::::::ss   oo:::::::::::oo  h:::::h     h:::::h\n" +
                "iiiiiiii  sssssssssss      sssssssssss       ooooooooooo    hhhhhhh     hhhhhhh\n" );


    }
}