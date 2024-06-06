package com.brokurly.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ExampleRepository {
//     MyBatis -> SQL Mapper -> Map? key & value로 구성된 자료구조
//     Mapper & Mapping -> 뭔가를 key와 value로 묶는 것(묶어주는 친구?)
//     Mapping (ex. RequestMapping) -> key: URI, value: Controller(또는 해당 Controller 안의 메서드)
//     (SQL) Mapper (ex. SQL Mapper) -> key: ID(메서드명), value: SQL
//
//     왜 SQL Mapper를 사용하는가? -> 이걸 알아야 왜 지금처럼 사용을 하는지 이해가 되겠죠?
//     SQL Mapper의 등장 배경
//     JDBC -> Java (여러) DB에 접근하는 (통합된) 기술 (ex. MySQL, Oracle, MariaDB 등등..)
//     처음 JDBC를 쓰기 전에는 각 DB를 Java로 연결하는 기술(Driver)이 전부 달랐어요
//     그러니까 개발자들이 DB 연결 기술을 쓰려면 저걸 다 공부했어야 됐어요
//     그래서 통합된 DB 접근 기술인 JDBC를 Java 진영이 만들어요
//
//     Connection -> 말 그대로 DB랑 연결을 해주는 친구 (Connection이 필요로 하는 값이 url, id, pwd) -> root-context.xml
//     PreparedStatement -> 변하는 값을 쉽게 넣게 해주는 친구
//     PreparedStatement의 장점
//     -> 보안: 원래 문자열을 합치려면? "string" + "something" -> 어떤 값이 오더라도 문제가 없어요, 근데 ps를 쓰면 파라미터로 합치기 때문에 좋다
//     -> 성능: 문자열을 +로 합치는 건 엄청나게 비효율적인 행위, 문자열은 '불변' -> String은 실제로 합쳐지는 게 아님, 새로 만드는 것
//     ResultSet -> SQL을 수행하면 어떤 결과물이 나온다. (특히 SELECT문), SQL의 결과를 반환받는 친구
//
//     그래서 개발자들이 귀찮음을 토대로 새로운 기술을 만듭니다. -> SQL Mapper (Mybatis, JPA)
//     여전히 Java로 DB를 연결하려면 JDBC 기술이 필요합니다. 그런데 동일하는 게 반복하는 부분을 줄일 수 없을까?
//     개발자가 SQL만 잘 작성하면 DB에 쉽게 접근할 수 있게 하고 싶다.
//
//     MyBatis의 역할 -> SQL만 쓰고 어떤 인터페이스에 연결할지만 정해주면 나머지는 알아서 해줄게
//     그런데! 원래는 인터페이스가 아니라 구체적인 클래스에 SqlSession이라는 친구를 써야 했습니다.
//     근데 이것도 귀찮다! 그래서 인터페이스만 잘 짜면 나머지는 Mybatis가 해줍니다.
//
//     구체적으로 MyBatis를 쓰는 방법이 어떻게 되는가?
//     방법은 자유롭게 하시면 되는데 중요한 건 SQL과 인터페이스를 잘 짜야 됩니다.
//     1. SQL(*Mapper.xml) -> 이름 그대로 SQL을 여기다가 짜면 됩니다.
//     2. @Mapper 인터페이스 -> SQL을 Java에서 사용할 수 있도록 하는 연결점
//     3. mybatis-config.xml -> 내가 편하게 쓰고 싶은 변수명을 등록 (com.brokurly.domain.Order -> Order)
//
//     인터페이스 작성할 때 주의할 점
//     파라미터를 여러 개 넘기고 싶은데?
//     1. 파라미터가 엄청 많고 서로 연관된 경우 (같은 테이블인 친구들) -> 객체(Dto)로 묶으면 됨
//     2. 파라미터가 별로 없는데 서로 별로 관련이 없다(주관적) -> @Param("정확한 이름")
//     3. 파라미터도 많고, 연관도 별로 없으면 -> 최대한 연관 있는 친구를 묶어서 여러 객체를 보낸다
//     반환 타입을 잘 모르겠어요 + exception
//     가장 많이 실수하는 부분이 insert() + throws 입니다. 왜? 원장님이 그렇게 써서
//     원장님이 그렇게 쓴 이유 -> SqlSession이 가지고 있는 기본 insert()의 반환 타입이 int에요
//     이게 왜 int인가? JDBC의 ResultSet이 insert, update문을 실행하면 영향을 준 행의 갯수를 반환
//     근데 저희 이거 필요한가요? NO -> 그러면 혼돈만 온다.
//     Exception도 마찬가지 -> 잘 보시면 throws 뒤에 있는 Exception 부분 불 꺼져 있을 겁니다.
//     왜? 안 쓰니까 -> 이것도 마찬가지로 혼돈만 줍니다. 그러니까 쓰지 마십쇼.
//
//     이제 @Mapper 인터페이스(Dao)랑 *Mapper.xml을 잘 만들었다면, 이걸 사용해야겠죠?
//     원래는 Repository라는 파트를 한 번 거쳐서 진짜 잘 가공된 데이터를 넘겨주는 게 좋아요
//     하지만 너무 어려우니까 Dao를 바로 Service에서 불러서 쓰시면 됩니다.
//
//     그러면 인터페이스 밖에 없는데 Dao가 가진 메서드를 어떻게 사용하나요?
//     스프링의 도움을 받으면 됩니다. -> 의존성 주입 (DI; Dependency Injection)
//     의존성 주입을 대표하는 키워드가 뭐죠? @Autowired
//     그러면 이 @Autowired는 어떻게 쓸까요?
//     1. 생성자(Constructor) 주입 -> 생성자 위에 @Autowired 붙이기 (when? 처음 한 번만 세팅하면 끝일 때)
//     2. 수정자(Setter) 주입 -> Setter 위에 @Autowired 붙이기 (when? 생성 이후에도 수정할 필요가 있을 때)
//     3. 필드(Field) 주입 -> 변수 위에 @Autowired 붙이기 <- 이건 안 쓰는 게 좋아요!
//
//
//     ! Domain과 Dto를 분리하는 이유
//     Domain은 Dao에서 꺼내온 '테이블의 한 행(한 row의 모든 column) 그 자체'
//     그렇기 때문에 Domain을 직접 다루는 것은 위험하다 -> 왜? 필요하지 않은 값들도 수정할 여지가 생긴다 (열려 있으니까 -> Getter & Setter)
//     따라서 Domain에는 Getter와 Setter를 만들지 않고, 순수하게 자기 내부에서 값을 처리할 수 있도록 만든다 -> 캡슐화
//     그러면 다른 layer(ex. Service, Repository)에서는 이 값에 어떻게 접근하는가? -> Dto를 Domain 내부에서 만들면 된다!
//     Dto는 Getter & Setter를 할 수 있게 열어두는 대신에, 딱 필요한 변수(column)만 넣어두면 된다 -> 외부에서 개발자가 불필요하게 값에 접근할 수 없음
//
//     -> ex. 싱글톤 : 객체를 한 번만 생성을 하고, 자신의 인스턴스 주소를 메서드로 받아간다
//     private static final 어떤클래스 인스턴스명 = new 어떤클래스();
//     public getInstance() { return 인스턴스명; } <- 이렇게 하면 불필요하게 객체를 생성하지 못하게 막을 수 있다
//
//     구체적인 사용 예시
//     1. 만약 select를 한다면?
//     Dao에서 값을 꺼내서 Domain에 담는다 -> Domain에서 Dto 객체를 메서드로 만들어서 반환해준다
//     2. 만약 update를 한다면?
//     Controller에서 넘어오는 값은 Dto이다 -> Dto에서 Dao를 통해 Domain을 찾는다
//     -> 이 Domain에 내부 메서드에 Dto를 인자로 받아서 자신의 상태를 변경 -> Dao에 Domain을 넘겨서 update SQL을 수행
//     3. 만약 insert를 한다면?
//     Controller에서 넘어오는 값은 Dto이다 (왜 Dto를? 자동 생성되는 친구들이 있다(ex. 일련번호, 시간) -> 그러면 접근을 못하게 만들어야 된다)
//     Domain에 필요한 값만 세팅해서 Dao에 Domain을 넘겨주면 된다 (어떻게 가능하냐? 자동 생성, nullable, default 값이 있는 애들은 안 넘겨도 된다)

    // Dao는 Domain과 1대1 매칭이다 -> Dao에서 꺼낸 Domain은 어디로 가지 않는다
    // 만약 Domain의 값이 필요하면, Dto를 만들어서 보낸다
    // Domain은 Repository 영역을 벗어나지 않는다.
}