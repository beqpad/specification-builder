<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
  
  <xsl:template match="/development_specification">
    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title><xsl:value-of select="metadata/project_name"/> - 開発仕様書</title>
        <link rel="stylesheet" type="text/css" href="../css/specifications.css"/>
      </head>
      <body>
        <div class="container">
          <div class="header">
            <h1><xsl:value-of select="metadata/project_name"/></h1>
            <div class="subtitle">開発仕様書</div>
          </div>

          <div class="metadata">
            <h2>ドキュメント情報</h2>
            <div class="metadata-grid">
              <div class="metadata-item">
                <span class="metadata-label">プロジェクト名</span>
                <div class="metadata-value">
                  <xsl:choose>
                    <xsl:when test="metadata/project_name != ''">
                      <xsl:value-of select="metadata/project_name"/>
                    </xsl:when>
                    <xsl:otherwise><span class="empty-value"></span></xsl:otherwise>
                  </xsl:choose>
                </div>
              </div>
              <div class="metadata-item">
                <span class="metadata-label">バージョン</span>
                <div class="metadata-value">
                  <xsl:choose>
                    <xsl:when test="metadata/version != ''">
                      <xsl:value-of select="metadata/version"/>
                    </xsl:when>
                    <xsl:otherwise><span class="empty-value"></span></xsl:otherwise>
                  </xsl:choose>
                </div>
              </div>
            </div>
          </div>

          <div class="content">
            <xsl:if test="development_environment">
              <div class="section">
                <h2 class="section-header">開発環境</h2>
                <div class="section-content">
                  <xsl:if test="development_environment/tools/development_tool">
                    <div class="subsection">
                      <h3 class="subsection-header">開発ツール</h3>
                      <ul class="item-list">
                        <xsl:for-each select="development_environment/tools/development_tool">
                          <li class="item">
                            <div class="item-header">
                              <xsl:value-of select="@name"/> v<xsl:value-of select="@version"/>
                            </div>
                            <div class="item-content">
                              <p><strong>目的:</strong> <xsl:value-of select="@purpose"/></p>
                            </div>
                          </li>
                        </xsl:for-each>
                      </ul>
                    </div>
                  </xsl:if>
                </div>
              </div>
            </xsl:if>

            <xsl:if test="code_implementation/implementation_modules/module">
              <div class="section">
                <h2 class="section-header">実装モジュール</h2>
                <div class="section-content">
                  <ul class="item-list">
                    <xsl:for-each select="code_implementation/implementation_modules/module">
                      <li class="item">
                        <div class="item-header">
                          <span class="item-id"><xsl:value-of select="@id"/></span>
                          <xsl:value-of select="name"/>
                        </div>
                        <div class="item-content">
                          <p><strong>場所:</strong> <xsl:value-of select="location"/></p>
                          <p><strong>言語:</strong> <xsl:value-of select="programming_language"/></p>
                          <p><strong>実装ノート:</strong> <xsl:value-of select="implementation_notes"/></p>
                        </div>
                      </li>
                    </xsl:for-each>
                  </ul>
                </div>
              </div>
            </xsl:if>

            <xsl:if test="ci_cd_pipeline/stage">
              <div class="section">
                <h2 class="section-header">CI/CDパイプライン</h2>
                <div class="section-content">
                  <ul class="item-list">
                    <xsl:for-each select="deployment_automation/ci_cd_pipeline/stage">
                      <li class="item">
                        <div class="item-header">
                          <xsl:value-of select="@name"/>
                        </div>
                        <div class="item-content">
                          <p><strong>トリガー:</strong> <xsl:value-of select="@triggers"/></p>
                          <p><strong>アクション:</strong> <xsl:value-of select="@actions"/></p>
                        </div>
                      </li>
                    </xsl:for-each>
                  </ul>
                </div>
              </div>
            </xsl:if>
          </div>

          <div class="navigation">
            <div class="nav-links">
              <a href="../detailed-design/index.html" class="nav-link">← 詳細設計</a>
              <a href="../index.html" class="nav-link">目次</a>
              <a href="../testing/index.html" class="nav-link">テスト →</a>
            </div>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>