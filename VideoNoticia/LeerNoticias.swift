//
//  LeerNoticias.swift
//  VideoNoticia
//
//  Created by alicharlie on 12/05/16.
//  Copyright © 2016 codepix. All rights reserved.
//

import Foundation


class LeerNoticias{


    func getNoticias(termino:(datos:[String])->()){
      let liga = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/arts/30.json?api-key=d76250fe444545b2bae2a5a1161584df"
      let url = NSURL(string: liga)!
      NSURLSession.sharedSession().dataTaskWithURL(url) { (dato:NSData?, respuesta:NSURLResponse?, error:NSError?) in
            var titulos:[String] = []
            do{
             let resultado = try NSJSONSerialization.JSONObjectWithData(dato!, options: NSJSONReadingOptions.MutableLeaves) as! NSDictionary
            
                for valor in resultado["results"] as! [NSDictionary]{
                  titulos.append(valor["title"] as! String)
                }
             dispatch_async(dispatch_get_main_queue() , {
                termino(datos: titulos)
             })
            }catch{
              print("Error en lectura")
            }
        }.resume()
        }
    }



