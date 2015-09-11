package org.myorganization


public class SmallTest {
  public static void main(String[]) {
    Model model = new Model().
         addEdge(new Edge("e_FirstAction").setSourceVertex(new Vertex("Start").setTargetVertex(new Vertex("v_VerifySomeAction"))).
         addEdge(new Edge("e_AnotherAction").setSourceVertex(new Vertex("v_VerifySomeAction").setTargetVertex(new Vertex("v_VerifySomeOtherAction"))).
         addEdge(new Edge("e_SomeOtherAction").setSourceVertex(new Vertex("v_VerifySomeOtherAction").setTargetVertex(new Vertex("v_VerifySomeOtherAction"))).
         addEdge(new Edge("e_SomeAction").setSourceVertex(new Vertex("v_VerifySomeOtherAction").setTargetVertex(new Vertex("v_VerifySomeAction")));
         
    
    

  }
}
