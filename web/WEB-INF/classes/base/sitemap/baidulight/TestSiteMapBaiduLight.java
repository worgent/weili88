/*
 * Copyright 2003-2009 the original author or authors.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 */
package base.sitemap.baidulight;

import javax.xml.bind.*;
import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;

public class TestSiteMapBaiduLight {

//	protected final static String URLSET_START = "<?xml version='1.0' encoding='UTF-8'?>\n"
//			+ "<urlset xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n"
//			+ "         xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\"\n"
//			+ "         xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n";
//	protected final static String URLSET_END = "\n</urlset>";

    protected final static String SITEMAPINDEX_START = "<?xml version='1.0' encoding='UTF-8'?>\n"
            + "<urlset>\n";
    protected final static String SITEMAPINDEX_END = "\n</urlset>";

    public static void writeSitemapIndex(Writer writer, Iterator<? extends Url> mappings) throws IOException {
        writeXml(writer, SITEMAPINDEX_START, mappings, SITEMAPINDEX_END);
    }
//
//	public static long writeUrlset(Writer writer, Iterator<Url> urls) throws IOException {
//		return writeXml(writer, URLSET_START, urls, URLSET_END);
//	}

    private static long writeXml(Writer writer, String start, Iterator<?> it, String end) throws IOException {
        writer.write(start);
        long count = writeSubtree(writer, it);
        writer.write(end);
        return count;
    }

    public static long writeSubtree(Writer writer, Iterator<?> it) throws IOException {
        long size = 0;
        Marshaller m;
        try {
            JAXBContext jc = JAXBContext.newInstance(Url.class);
            m = jc.createMarshaller();
            m.setProperty(Marshaller.JAXB_FRAGMENT, true);
            m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        }
//        catch (PropertyException e) {
//            throw new DataBindingException(e);
//        } catch (JAXBException e) {
//            throw new DataBindingException(e);
//        }
        catch (Exception e) {
            e.printStackTrace();
        }

        boolean first = true;
        while (it.hasNext()) {
            if (first)
                first = false;
            else
                writer.write("\n");
//            try {
//               // m.marshal(it.next(), writer);
//            } catch (JAXBException e) {
//                throw new IOException(e);
//            }
            size++;
        }
        return size;
    }

    public static void generateSiteMap(ArrayList<Url> list,String xmlPath) {
        try {
            //输出到屏幕
            //Writer wt = new PrintWriter(System.out);
            File file = new File(xmlPath);
            Writer wt = new PrintWriter(new FileWriter(file));

            TestSiteMapBaiduLight.writeSitemapIndex(wt, list.iterator());
            wt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {


    }
}
